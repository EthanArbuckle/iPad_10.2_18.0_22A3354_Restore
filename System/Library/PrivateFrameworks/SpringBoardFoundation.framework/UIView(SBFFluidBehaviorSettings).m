@implementation UIView(SBFFluidBehaviorSettings)

+ (void)sb_animateWithSettings:()SBFFluidBehaviorSettings mode:animations:completion:
{
  void (**v11)(_QWORD);
  void (**v12)(id, uint64_t, _QWORD);
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v11 = a5;
  v12 = a6;
  switch(a4)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIView+SBFFluidBehaviorSettings.m"), 43, CFSTR("sb_animateWithSettings needs a explicit update mode, not SBAnimationUpdateModeUnspecified"));

      break;
    case 1:
      v11[2](v11);
      if (v12)
        goto LABEL_6;
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v11);
      if (v12)
LABEL_6:
        v12[2](v12, 1, 0);
      break;
    case 3:
      v14 = a1;
      v15 = v19;
      v16 = 0;
      goto LABEL_10;
    case 4:
      v17 = (void *)MEMORY[0x1E0CEABB0];
      _SBModifyFrameRateForAnimationBlockFromSettings(v11, v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_animateByRetargetingAnimations:completion:", v18, v12);

      break;
    case 5:
      v14 = a1;
      v15 = v19;
      v16 = 1;
LABEL_10:
      objc_msgSend(v14, "sb_animateWithSettings:interactive:animations:completion:", v15, v16, v11, v12);
      break;
    default:
      break;
  }

}

+ (void)sb_animateWithSettings:()SBFFluidBehaviorSettings interactive:animations:completion:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a5;
  v10 = a6;
  v11 = objc_msgSend(v15, "behaviorType");
  if ((unint64_t)(v11 - 1) < 2)
  {
    v12 = (void *)MEMORY[0x1E0CEABB0];
    _SBModifyFrameRateForAnimationBlockFromSettings(v9, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_animateUsingSpringBehavior:tracking:animations:completion:", v15, a4, v13, v10);
LABEL_5:

    goto LABEL_6;
  }
  if (!v11)
  {
    v14 = (void *)MEMORY[0x1E0CEABB0];
    _SBModifyFrameRateForAnimationBlockFromSettings(v9, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_animateWithFrictionBounceAnimations:completion:", v13, v10);
    goto LABEL_5;
  }
LABEL_6:

}

@end
