@implementation UIDatePickerOverlayPresentation

uint64_t __64___UIDatePickerOverlayPresentation_presentDatePicker_onDismiss___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "set_overlayPresentation:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "platterView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    if (v4)
      objc_msgSend(v5, "_transitionToDatePicker:", v6);
    else
      objc_msgSend(v5, "_presentNewDatePicker:", v6);
    v8 = objc_msgSend(*(id *)(a1 + 32), "datePickerMode");
    v9 = 3;
    if (!v8)
      v9 = 1;
    if (v8 == 1)
      v10 = 2;
    else
      v10 = v9;
    objc_msgSend(*(id *)(a1 + 40), "setActiveMode:", v10);
    return objc_msgSend(*(id *)(a1 + 40), "setDismissHandler:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

uint64_t __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke(uint64_t a1)
{
  CGFloat v2;
  double v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double Height;
  double v16;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGRect v20;
  CGRect v21;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "overlayPlatterInitialScale");
  v3 = v2;
  CGAffineTransformMakeScale(&v19, v2, v2);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v18 = v19;
  objc_msgSend(v4, "setTransform:", &v18);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "overlayPlatterInitialHeight");
  v14 = v13;
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  Height = CGRectGetHeight(v20);
  if (Height >= v14 / v3)
    v16 = v14 / v3;
  else
    v16 = Height;
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setBounds:", 0.0, 0.0, CGRectGetWidth(v21), v16);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "layoutIfNeeded");
}

uint64_t __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40), "removeFromSuperview");
  return result;
}

uint64_t __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setAlpha:", 0.0);
}

uint64_t __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81___UIDatePickerOverlayPresentation__prepareDatePickerPresentationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "setPresentingContainerViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "activeDatePicker");

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

uint64_t __58___UIDatePickerOverlayPresentation__presentNewDatePicker___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __58___UIDatePickerOverlayPresentation__presentNewDatePicker___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __58___UIDatePickerOverlayPresentation__presentNewDatePicker___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  _OWORD v5[3];
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a1 + 128);
  v6 = *(_OWORD *)(a1 + 112);
  v7 = v2;
  v8 = *(_OWORD *)(a1 + 144);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  objc_msgSend(v3, "setTransform:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCenter:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "datePickerTransitionAnimation");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "layoutIfNeeded");
}

uint64_t __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40), "datePickerTransitionCompletion");
  return result;
}

uint64_t __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setAlpha:", 0.0);
}

void __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_4(_QWORD *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[5];

  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", a1[5]);
  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_5;
  v6[3] = &unk_1E16B14C0;
  v3 = (void *)a1[6];
  v6[4] = a1[7];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_6;
  v4[3] = &unk_1E16B1BA0;
  v5 = v3;
  objc_msgSend(v2, "animateReducedMotionTransitionWithAnimations:completion:", v6, v4);

}

uint64_t __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setAlpha:", 1.0);
}

uint64_t __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76___UIDatePickerOverlayPresentation_animatePresentWithAnimations_completion___block_invoke(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __79___UIDatePickerOverlayPresentation_animateTransitionWithAnimations_completion___block_invoke(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __78___UIDatePickerOverlayPresentation_animateDismissalWithAnimations_completion___block_invoke(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

@end
