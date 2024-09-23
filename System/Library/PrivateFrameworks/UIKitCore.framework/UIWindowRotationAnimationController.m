@implementation UIWindowRotationAnimationController

uint64_t __58___UIWindowRotationAnimationController_animateTransition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
}

uint64_t __58___UIWindowRotationAnimationController_animateTransition___block_invoke_6(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048621, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

id __58___UIWindowRotationAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(void);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend((id)UIApp, "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "animations");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();

  if (dyld_program_sdk_at_least())
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58___UIWindowRotationAnimationController_animateTransition___block_invoke_3;
    v12[3] = &unk_1E16B1B28;
    v13 = *(id *)(a1 + 40);
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v12, 0, 0.0, 0.0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "__runAlongsideAnimations");
  }
  v6 = *(void **)(a1 + 48);
  if (v6 != v4)
  {
    objc_msgSend((id)UIApp, "keyWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
      goto LABEL_8;
  }
  objc_msgSend((id)UIApp, "keyWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstResponder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v9)
    v10 = v4;
  else
LABEL_8:
    v10 = 0;

  return v10;
}

uint64_t __58___UIWindowRotationAnimationController_animateTransition___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
  return 0;
}

void __58___UIWindowRotationAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  double v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __58___UIWindowRotationAnimationController_animateTransition___block_invoke_2;
  v13[3] = &unk_1E16C2CA8;
  v2 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v13[1] = 3221225472;
  v14 = v2;
  v15 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 48), "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView _performBlockDelayingTriggeringResponderEvents:forScene:]((uint64_t)UIView, v13, v3);

  if (!*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v6 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, CFSTR("UIWindowNewOrientationUserInfoKey"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("UIWindowWillAnimateRotationNotification"), v5, v8);

  }
  if (*(_BYTE *)(a1 + 89) && *(_QWORD *)(a1 + 64) != *(_QWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 48), "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 64);
    v11 = objc_msgSend(*(id *)(a1 + 56), "isAnimated");
    v12 = 0.0;
    if (v11)
      v12 = *(double *)(a1 + 80);
    objc_msgSend(v9, "_updateClientSettingsToInterfaceOrientation:withAnimationDuration:", v10, v12);

  }
}

void __58___UIWindowRotationAnimationController_animateTransition___block_invoke_4(id *a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(a1[4], "setAnimations:", 0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58___UIWindowRotationAnimationController_animateTransition___block_invoke_5;
  v3[3] = &unk_1E16B6288;
  v4 = a1[5];
  objc_msgSend(a1[6], "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView _performBlockDelayingTriggeringResponderEvents:forScene:]((uint64_t)UIView, v3, v2);

  objc_msgSend(a1[5], "_setAnimator:", 0);
  objc_msgSend(a1[6], "_setAnimationController:", 0);

}

@end
