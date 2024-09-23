@implementation UIAlertControllerVisualStyleAlertTV

- (id)titleLabelFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
}

- (id)titleLabelColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (id)messageLabelFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
}

- (id)_detailMessageFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption2"));
}

- (double)_marginAboveDetailMessageFirstBaseline
{
  return 35.0;
}

- (double)marginAboveTitleLabelFirstBaseline
{
  return 40.0;
}

- (double)marginBelowTitleLabelLastBaseline
{
  return 60.0;
}

- (double)marginBelowLastLabelLastBaseline
{
  return 40.0;
}

- (double)marginBelowMessageLabelLastBaseline
{
  return 47.0;
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
    return 60.0;
  -[UIAlertControllerVisualStyleAlertTV marginAboveTitleLabelFirstBaseline](self, "marginAboveTitleLabelFirstBaseline");
  return result;
}

- (int64_t)maximumNumberOfLinesInTitleLabel
{
  return 4;
}

- (int64_t)maximumNumberOfLinesInMessageLabel
{
  return 7;
}

- (double)_minimumButtonWidth
{
  return 500.0;
}

- (double)_maximumContentWidth
{
  return 960.0;
}

- (double)maximumWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[UIAlertControllerVisualStyle actionSequenceEdgeInsets](self, "actionSequenceEdgeInsets");
  v4 = v3;
  -[UIAlertControllerVisualStyle actionSequenceEdgeInsets](self, "actionSequenceEdgeInsets");
  v6 = v4 + v5;
  -[UIAlertControllerVisualStyleAlertTV _maximumContentWidth](self, "_maximumContentWidth");
  return v7 + v6 + 70.0;
}

- (double)actionWidthForMinimumActionWidth:(double)a3 availableWidth:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  +[_UIAlertControllerTVBackgroundView backgroundInsetAmount](_UIAlertControllerTVBackgroundView, "backgroundInsetAmount", a3, a4);
  v7 = v6 + v6;
  v8 = a3 - (v6 + v6);
  -[UIAlertControllerVisualStyleAlertTV _maximumContentWidth](self, "_maximumContentWidth");
  v10 = v9;
  -[UIAlertControllerVisualStyleAlertTV _minimumButtonWidth](self, "_minimumButtonWidth");
  if (v11 < v8)
    v11 = v8;
  if (v10 <= v11)
    v11 = v10;
  return v7 + v11;
}

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 120.0;
  v4 = 80.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v4;
  result.left = v5;
  result.top = v3;
  return result;
}

- (id)textFieldContainingViewWithTextField:(id)a3 position:(int64_t)a4
{
  id v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = [UIView alloc];
  v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v6, "addSubview:", v4);
  _NSDictionaryOfVariableBindings(CFSTR("textField"), v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(horizontalInset)-[textField]-(horizontalInset)-|"), 0, &unk_1E1A9B450, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v6, "addConstraints:", v8);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(verticalInset)-[textField(>=minTextFieldHeight)]-(verticalInset)-|"), 0, &unk_1E1A9B450, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v6, "addConstraints:", v9);

  return v6;
}

- (int64_t)permittedActionLayoutDirection
{
  return 1;
}

- (BOOL)hideCancelAction:(id)a3 inAlertController:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (id)dimmingViewForAlertController:(id)a3
{
  UIVisualEffectView *v4;
  void *v5;
  UIVisualEffectView *v6;

  v4 = [UIVisualEffectView alloc];
  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", -[UIAlertControllerVisualStyleAlertTV _effectStyle](self, "_effectStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIVisualEffectView initWithEffect:](v4, "initWithEffect:", v5);

  return v6;
}

- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4
{
  double result;

  result = 0.7;
  if (!a3)
    return 0.5;
  return result;
}

- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9
{
  _BOOL4 v13;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  CGAffineTransform *v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  _UIAlertControllerVisualStyleAlertTVCustomCurveFactory *v33;
  _UIAlertControllerVisualStyleAlertTVCustomCurveFactory *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  double v43;
  id v44;
  _BOOL4 v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  double v54;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  double v66;
  _OWORD v67[3];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;

  v13 = a5;
  v16 = a3;
  v17 = a4;
  v48 = a6;
  v47 = a7;
  v40 = a9;
  v18 = *MEMORY[0x1E0C9BAA8];
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v72 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v73 = v19;
  v68 = v18;
  v69 = v72;
  v70 = v19;
  v71 = v18;
  v45 = v13;
  v20 = (CGAffineTransform *)&v68;
  if (v13)
    v20 = (CGAffineTransform *)&v71;
  CGAffineTransformMakeScale(v20, 0.9, 0.9);
  v49 = v17;
  objc_msgSend(v17, "_dimmingView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", -[UIAlertControllerVisualStyleAlertTV _effectStyle](self, "_effectStyle"));
  v22 = objc_claimAutoreleasedReturnValue();
  if (v13)
    v23 = 0.0;
  else
    v23 = 0.3;
  if (v13)
    v24 = 0.3;
  else
    v24 = 0.0;
  if (v13)
    v25 = 0.523809524;
  else
    v25 = 0.0;
  if (v13)
    v26 = 0.476190476;
  else
    v26 = 0.5;
  if (v13)
    v27 = 0.357142857;
  else
    v27 = 0.5;
  if (v13)
    v28 = 1.0;
  else
    v28 = 0.0;
  v43 = v28;
  if (v13)
    v29 = 0.0;
  else
    v29 = 1.0;
  if (v13)
    v30 = (void *)v22;
  else
    v30 = 0;
  if (v13)
    v31 = 0;
  else
    v31 = (void *)v22;
  +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.117647059, 0.117647059, 0.117647059, v23);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v71;
  v67[1] = v72;
  v67[2] = v73;
  objc_msgSend(v16, "setTransform:", v67);
  objc_msgSend(v16, "setAlpha:", v29);
  objc_msgSend(v21, "setBackgroundColor:", v32);
  objc_msgSend(v16, "_preferredActionView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[_UIAlertControllerVisualStyleAlertTVCustomCurveFactory initWithCustomCurve:]([_UIAlertControllerVisualStyleAlertTVCustomCurveFactory alloc], "initWithCustomCurve:", 0);
  v34 = -[_UIAlertControllerVisualStyleAlertTVCustomCurveFactory initWithCustomCurve:]([_UIAlertControllerVisualStyleAlertTVCustomCurveFactory alloc], "initWithCustomCurve:", 1);
  v46 = v31;
  objc_msgSend(v21, "setEffect:", v31);
  v35 = MEMORY[0x1E0C809B0];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke;
  v62[3] = &unk_1E16C5CA0;
  v44 = v21;
  v63 = v44;
  v42 = v30;
  v64 = v42;
  v36 = v32;
  v65 = v36;
  v66 = v24;
  v60[0] = v35;
  v60[1] = 3221225472;
  v60[2] = __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2;
  v60[3] = &unk_1E16B1BA0;
  v41 = v40;
  v61 = v41;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v33, v62, v60, a8, 0.0);
  v55[0] = v35;
  v55[1] = 3221225472;
  v55[2] = __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3;
  v55[3] = &unk_1E16BF720;
  v37 = v16;
  v56 = v37;
  v57 = v68;
  v58 = v69;
  v59 = v70;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v34, v55, 0, v26 * a8, v25 * a8);
  v52[0] = v35;
  v52[1] = 3221225472;
  v52[2] = __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_4;
  v52[3] = &unk_1E16B1888;
  v38 = v37;
  v53 = v38;
  v54 = v43;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v33, v52, 0, v27 * a8, v25 * a8);
  if (v45)
  {
    v50[0] = v35;
    v50[1] = 3221225472;
    v50[2] = __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_5;
    v50[3] = &unk_1E16B1B28;
    v51 = v39;
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v33, v50, 0, a8 * 0.357142857, v25 * a8 + 0.119047619);

  }
}

void __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setEffect:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "colorWithAlphaComponent:", *(double *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

uint64_t __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3(uint64_t a1)
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

uint64_t __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 1);
}

- (UIEdgeInsets)textFieldContentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 35.0;
  v3 = 70.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

- (double)textFieldHorizontalMargin
{
  return 26.0;
}

- (BOOL)placementAvoidsKeyboard
{
  return 0;
}

- (id)preferredActionForActions:(id)a3 suggestedPreferredAction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "style") == 2 || objc_msgSend(v7, "style") == 1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v14, "style", (_QWORD)v18) != 2 && objc_msgSend(v14, "style") != 1)
          {
            v15 = v14;

            goto LABEL_25;
          }
          if (!v11)
          {
            if (objc_msgSend(v14, "style") == 1)
              v11 = v14;
            else
              v11 = 0;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  if (v11)
    v16 = v11;
  else
    v16 = v7;
  v15 = v16;
LABEL_25:

  return v15;
}

- (int64_t)_effectStyle
{
  return 4005;
}

- (id)_keyCommandInputForCancelAction
{
  return 0;
}

@end
