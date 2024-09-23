@implementation UIAlertControllerVisualStyleAlertModernTV

- (id)titleLabelFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedCallout"));
}

- (id)titleLabelColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (id)messageLabelFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption1"));
}

- (double)_marginAboveDetailMessageFirstBaseline
{
  return 19.0;
}

- (double)_marginBelowDetailMessage
{
  double v2;

  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount](_UIAlertControllerModernTVBackgroundView, "backgroundInsetAmount");
  return v2;
}

- (id)messageLabelColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (id)messageCompositingFilter
{
  void *v2;
  uint64_t v3;
  id *v4;

  -[UIAlertControllerVisualStyle traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  v4 = (id *)MEMORY[0x1E0CD2EA0];
  if (v3 != 2)
    v4 = (id *)MEMORY[0x1E0CD2E98];
  return *v4;
}

- (double)marginAboveTitleLabelFirstBaseline
{
  double v2;

  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount](_UIAlertControllerModernTVBackgroundView, "backgroundInsetAmount");
  return v2 + 45.0;
}

- (double)marginBelowLastLabelLastBaseline
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UIAlertControllerVisualStyleAlertModernTV titleLabelFont](self, "titleLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTFontGetLanguageAwareOutsets();

  -[UIAlertControllerVisualStyleAlertModernTV titleLabelFont](self, "titleLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descender");
  v6 = 0.0 - v5;

  return v6;
}

- (double)marginBelowMessageLabelLastBaseline
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[UIAlertControllerVisualStyleAlertModernTV messageLabelFont](self, "messageLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CTFontGetLanguageAwareOutsets();

  -[UIAlertControllerVisualStyleAlertModernTV messageLabelFont](self, "messageLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descender");
  v6 = 0.0 - v5;

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
    return 49.0;
  -[UIAlertControllerVisualStyleAlertModernTV marginAboveTitleLabelFirstBaseline](self, "marginAboveTitleLabelFirstBaseline");
  return result;
}

- (id)tintColorForAlertController:(id)a3
{
  return +[UIColor systemBlueColor](UIColor, "systemBlueColor", a3);
}

- (int64_t)maximumNumberOfLinesInTitleLabel
{
  return 5;
}

- (int64_t)maximumNumberOfLinesInMessageLabel
{
  return 0;
}

- (double)maximumWidth
{
  return -1.0;
}

- (double)maximumContentHeight
{
  return 575.0;
}

- (BOOL)definesWidthByContentFitting
{
  return 1;
}

- (double)minimumWidthFittingContentView:(id)a3 titleLabel:(id)a4 minimumWidthForAllActions:(double)a5 preferredSizeForContentContainers:(CGSize)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  _QWORD v26[5];

  height = a6.height;
  width = a6.width;
  v11 = a3;
  v12 = a4;
  -[UIAlertControllerVisualStyle descriptor](self, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "numberOfVisibleActions") == 2)
  {
    -[UIAlertControllerVisualStyle actionSpacingForHorizontalLayout:](self, "actionSpacingForHorizontalLayout:", 1);
    v15 = v14;
    -[UIAlertControllerVisualStyle actionSequenceEdgeInsets](self, "actionSequenceEdgeInsets");
    v17 = v16;
    -[UIAlertControllerVisualStyle actionSequenceEdgeInsets](self, "actionSequenceEdgeInsets");
    if (a5 + a5 + v15 + v17 + v18 <= 588.0)
      v19 = &unk_1E1A94508;
    else
      v19 = &unk_1E1A944F0;
  }
  else
  {
    v19 = &unk_1E1A94520;
  }
  -[UIAlertControllerVisualStyleAlertModernTV _minimumAlertWidthWithTitleLabel:withCandidateSizes:](self, "_minimumAlertWidthWithTitleLabel:withCandidateSizes:", v12, v19);
  v21 = v20;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __147__UIAlertControllerVisualStyleAlertModernTV_minimumWidthFittingContentView_titleLabel_minimumWidthForAllActions_preferredSizeForContentContainers___block_invoke;
  v26[3] = &__block_descriptor_40_e35_B24__0__NSNumber_8__NSDictionary_16l;
  *(double *)&v26[4] = v20;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "count"))
  {
    -[UIAlertControllerVisualStyleAlertModernTV _minimumAlertWidthWithContentView:withCandidateSizes:preferredSizeForContentContainers:](self, "_minimumAlertWidthWithContentView:withCandidateSizes:preferredSizeForContentContainers:", v11, v23, width, height);
    v21 = v24;
  }

  return v21;
}

BOOL __147__UIAlertControllerVisualStyleAlertModernTV_minimumWidthFittingContentView_titleLabel_minimumWidthForAllActions_preferredSizeForContentContainers___block_invoke(uint64_t a1, void *a2)
{
  float v3;

  objc_msgSend(a2, "floatValue");
  return *(double *)(a1 + 32) <= v3;
}

- (double)_minimumAlertWidthWithTitleLabel:(id)a3 withCandidateSizes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  int64_t v21;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0.0;
  if (v6 && objc_msgSend(v7, "count"))
  {
    v23 = objc_msgSend(v6, "numberOfLines");
    objc_msgSend(v6, "setNumberOfLines:", 0);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
LABEL_5:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14), "floatValue");
        v16 = v15;
        -[UIAlertControllerVisualStyleAlertModernTV _labelHorizontalInsets](self, "_labelHorizontalInsets");
        v18 = v16 - (v17 + v17);
        v24 = 0;
        objc_msgSend(v6, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "attributedText");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        _UIComputedSizeForLabel(v6, v19, v20, 0, &v24, 0, 0, v18, 1.79769313e308);

        v21 = v24;
        if (v21 <= -[UIAlertControllerVisualStyleAlertModernTV maximumNumberOfLinesInTitleLabel](self, "maximumNumberOfLinesInTitleLabel"))break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v12)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v16 = 0.0;
    }

    objc_msgSend(v6, "setNumberOfLines:", v23);
    if (fabs(v16) >= 2.22044605e-16)
      v9 = v16;
    else
      v9 = 820.0;
  }

  return v9;
}

- (double)_minimumAlertWidthWithContentView:(id)a3 withCandidateSizes:(id)a4 preferredSizeForContentContainers:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  height = a5.height;
  width = a5.width;
  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  -[UIAlertControllerVisualStyle descriptor](self, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerVisualStyleAlertModernTV maximumContentHeight](self, "maximumContentHeight");
  v13 = v12;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v18), "floatValue", (_QWORD)v27);
        v20 = v19;
        LODWORD(v21) = 1148846080;
        LODWORD(v22) = 1112014848;
        objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v19, 0.0, v21, v22);
        v24 = v23;
        if ((objc_msgSend(v11, "hasTitle") & 1) != 0 || objc_msgSend(v11, "hasMessage"))
          v24 = height + v24;
        if (v24 < v13)
        {
          v25 = fmax(v20, fmin(width, 820.0));
          goto LABEL_14;
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v16)
        continue;
      break;
    }
  }
  v25 = 0.0;
LABEL_14:

  if (fabs(v25) < 2.22044605e-16)
    v25 = 820.0;

  return v25;
}

- (double)maximumWidthForTitleAndMessageContentView
{
  return 820.0;
}

- (double)actionWidthForMinimumActionWidth:(double)a3 availableWidth:(double)a4
{
  double v5;
  double v6;
  double v7;
  double result;

  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount](_UIAlertControllerModernTVBackgroundView, "backgroundInsetAmount", a3);
  v6 = v5 + v5;
  v7 = 640.0 - v6;
  result = a4 - v6;
  if (v7 < result)
    return v7;
  return result;
}

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = _UIActionSheetPresentationControllerContentInsetsAdjustedForSafeAreaWithStandardContentInsets(a3, 60.0, 80.0, 60.0, 80.0);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (int64_t)permittedActionLayoutDirection
{
  void *v2;
  uint64_t v3;

  -[UIAlertControllerVisualStyle descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfVisibleActions");

  if (v3 == 2)
    return 2;
  else
    return 1;
}

- (id)dimmingViewForAlertController:(id)a3
{
  double v3;
  double v4;
  UIView *v5;
  UIView *v6;
  void *v7;

  if (_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_914, (uint64_t)CFSTR("TVAlert_BackgroundDimWhite")))v3 = 0.0;
  else
    v3 = *(double *)&qword_1ECD766E8;
  if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD766F0, (uint64_t)CFSTR("TVAlert_BackgroundDimAlpha")))v4 = 0.45;
  else
    v4 = *(double *)&qword_1ECD766F8;
  v5 = [UIView alloc];
  v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  return v6;
}

- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9
{
  _BOOL4 v11;
  id v13;
  id v14;
  __int128 v15;
  id v16;
  CGAffineTransform *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  _UIAlertControllerVisualStyleAlertTVCustomCurveFactory *v25;
  _UIAlertControllerVisualStyleAlertTVCustomCurveFactory *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  double v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  double v44;
  _OWORD v45[3];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  v11 = a5;
  v13 = a3;
  v14 = a9;
  v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v49 = *MEMORY[0x1E0C9BAA8];
  v50 = v15;
  v51 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v46 = v49;
  v47 = v15;
  v48 = v51;
  v16 = a4;
  v17 = (CGAffineTransform *)&v46;
  if (v11)
  {
    v17 = (CGAffineTransform *)&v49;
    v18 = 0.357142857;
  }
  else
  {
    v18 = 0.5;
  }
  if (v11)
    v19 = 0.476190476;
  else
    v19 = 0.5;
  if (v11)
    v20 = 0.523809524;
  else
    v20 = 0.0;
  if (v11)
    v21 = 1.0;
  else
    v21 = 0.0;
  if (v11)
    v22 = 0.0;
  else
    v22 = 1.0;
  CGAffineTransformMakeScale(v17, 0.9, 0.9);
  objc_msgSend(v16, "_dimmingView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = v49;
  v45[1] = v50;
  v45[2] = v51;
  objc_msgSend(v13, "setTransform:", v45);
  objc_msgSend(v13, "setAlpha:", v22);
  objc_msgSend(v13, "_preferredActionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[_UIAlertControllerVisualStyleAlertTVCustomCurveFactory initWithCustomCurve:]([_UIAlertControllerVisualStyleAlertTVCustomCurveFactory alloc], "initWithCustomCurve:", 0);
  v26 = -[_UIAlertControllerVisualStyleAlertTVCustomCurveFactory initWithCustomCurve:]([_UIAlertControllerVisualStyleAlertTVCustomCurveFactory alloc], "initWithCustomCurve:", 1);
  objc_msgSend(v23, "setAlpha:", v22);
  v27 = MEMORY[0x1E0C809B0];
  v41 = v14;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke;
  v42[3] = &unk_1E16B1888;
  v43 = v23;
  v44 = v21;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2;
  v40[3] = &unk_1E16B1BA0;
  v28 = v14;
  v29 = v23;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v25, v42, v40, a8, 0.0);
  v35[0] = v27;
  v35[1] = 3221225472;
  v35[2] = __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3;
  v35[3] = &unk_1E16BF720;
  v30 = v13;
  v36 = v30;
  v37 = v46;
  v38 = v47;
  v39 = v48;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v26, v35, 0, v19 * a8, v20 * a8);
  v32[0] = v27;
  v32[1] = 3221225472;
  v32[2] = __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_4;
  v32[3] = &unk_1E16B1888;
  v33 = v30;
  v34 = v21;
  v31 = v30;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v25, v32, 0, v18 * a8, v20 * a8);

}

uint64_t __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (id)preferredActionForActions:(id)a3 suggestedPreferredAction:(id)a4
{
  return a4;
}

- (BOOL)focusAvoidsNonDefaultActionsIfPossible
{
  return 1;
}

- (id)contentBackdropView
{
  _UIAlertControllerModernTVBackgroundView *v3;

  v3 = objc_alloc_init(_UIAlertControllerModernTVBackgroundView);
  -[UIAlertControllerVisualStyleAlertModernTV contentCornerRadius](self, "contentCornerRadius");
  -[_UIAlertControllerModernTVBackgroundView setCornerRadius:](v3, "setCornerRadius:");
  return v3;
}

- (BOOL)contentClipsToBounds
{
  return 1;
}

- (double)contentCornerRadius
{
  double result;

  +[_UIAlertControllerModernTVBackgroundView contentCornerRadius](_UIAlertControllerModernTVBackgroundView, "contentCornerRadius");
  return result;
}

- (BOOL)contentHasShadow
{
  return 1;
}

- (id)contentShadowColor
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (CGSize)contentShadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 4.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)contentShadowOpacity
{
  return 0.2;
}

- (double)minimumContentHeight
{
  double v2;

  -[UIAlertControllerVisualStyleAlertModernTV contentCornerRadius](self, "contentCornerRadius");
  return v2 + v2;
}

- (double)_minimumSpacingAboveTopmostLabelSafeAscender
{
  return 35.0;
}

- (double)_titleAndMessageHorizontalInset
{
  return 16.0;
}

- (double)_labelHorizontalInsets
{
  double v3;
  double v4;
  double v5;

  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount](_UIAlertControllerModernTVBackgroundView, "backgroundInsetAmount");
  v4 = v3;
  -[UIAlertControllerVisualStyleAlertModernTV _titleAndMessageHorizontalInset](self, "_titleAndMessageHorizontalInset");
  return v4 + v5;
}

- (BOOL)shouldRespectContentViewControllerClippingPreference
{
  return 1;
}

@end
