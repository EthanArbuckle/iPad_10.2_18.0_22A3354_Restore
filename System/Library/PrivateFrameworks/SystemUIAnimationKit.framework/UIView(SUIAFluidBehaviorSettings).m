@implementation UIView(SUIAFluidBehaviorSettings)

+ (void)suia_animateWithSettings:()SUIAFluidBehaviorSettings interactive:animations:completion:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a5;
  v10 = a6;
  if ((unint64_t)objc_msgSend(v13, "behaviorType") <= 1)
  {
    v11 = (void *)MEMORY[0x24BEBDB00];
    _SUIAModifyFrameRateForAnimationBlockFromSettings(v9, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_animateUsingSpringBehavior:tracking:animations:completion:", v13, a4, v12, v10);

  }
}

+ (void)suia_animateWithSettings:()SUIAFluidBehaviorSettings mode:animations:completion:
{
  void (**v10)(_QWORD);
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  switch(a4)
  {
    case 0:
      if (v11)
        (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
      break;
    case 1:
      v10[2](v10);
      if (v12)
        goto LABEL_7;
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BEBDB00], "_performWithoutRetargetingAnimations:", v10);
      if (v12)
LABEL_7:
        v12[2](v12, 1, 0);
      break;
    case 3:
      v13 = a1;
      v14 = v18;
      v15 = 0;
      goto LABEL_11;
    case 4:
      v16 = (void *)MEMORY[0x24BEBDB00];
      _SUIAModifyFrameRateForAnimationBlockFromSettings(v10, v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_animateByRetargetingAnimations:completion:", v17, v12);

      break;
    case 5:
      v13 = a1;
      v14 = v18;
      v15 = 1;
LABEL_11:
      objc_msgSend(v13, "suia_animateWithSettings:interactive:animations:completion:", v14, v15, v10, v12);
      break;
    default:
      break;
  }

}

- (void)suia_replaceInProcessAnimationForKeyPath:()SUIAFluidBehaviorSettings settings:mode:
{
  id v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v8 = a4;
  if (a5 == 5)
  {
    v9 = 1;
    goto LABEL_5;
  }
  if (a5 == 3)
  {
    v9 = 0;
LABEL_5:
    objc_msgSend(a1, "suia_replaceInProcessAnimationForKeyPath:settings:interactive:", v10, v8, v9);
  }

}

- (void)suia_replaceInProcessAnimationForKeyPath:()SUIAFluidBehaviorSettings settings:interactive:
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v8, "behaviorType") <= 1 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "_replaceInProcessAnimationForKey:behavior:interactive:", v9, v8, a5);

}

@end
