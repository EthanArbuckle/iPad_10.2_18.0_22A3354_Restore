@implementation UIView(SBUISystemApertureAnimationParameters)

+ (void)SBUISA_animateWithSettings:()SBUISystemApertureAnimationParameters animations:completion:
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v12, "isAnimated"))
  {
    v9 = objc_msgSend(v12, "isRetargeted");
    v10 = (void *)MEMORY[0x1E0CEABB0];
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "_animateByRetargetingAnimations:completion:", v7, v8);
    }
    else
    {
      objc_msgSend(v12, "fluidBehaviorSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_animateUsingSpringBehavior:tracking:animations:completion:", v11, objc_msgSend(v12, "tracking"), v7, v8);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "SBUISA_performWithoutAnimationOrRetargeting:", v7);
    if (v8)
      v8[2](v8, 1, 0);
  }

}

+ (void)SBUISA_performWithoutAnimationOrRetargeting:()SBUISystemApertureAnimationParameters
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__UIView_SBUISystemApertureAnimationParameters__SBUISA_performWithoutAnimationOrRetargeting___block_invoke;
  v6[3] = &unk_1E4C3E4C0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performWithoutAnimation:", v6);

}

@end
