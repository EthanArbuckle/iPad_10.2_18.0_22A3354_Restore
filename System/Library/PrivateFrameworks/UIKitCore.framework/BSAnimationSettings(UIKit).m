@implementation BSAnimationSettings(UIKit)

+ (void)tryAnimatingWithSettings:()UIKit fromCurrentState:actions:completion:
{
  id v11;
  id v12;
  void (**v13)(id, uint64_t);
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  _UISceneSettingsMediaTimingAnimationFactory *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BSAnimationSettings+UIKit.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("animations"));

  }
  objc_msgSend(v11, "duration");
  v15 = v14;
  objc_msgSend(v11, "delay");
  v17 = v16;
  objc_msgSend(v11, "timingFunction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isSpringAnimation"))
  {
    v19 = v11;
    objc_msgSend(v19, "duration");
    v21 = v20;
    objc_msgSend(v19, "delay");
    v23 = v22;
    if (a4)
      v24 = 4;
    else
      v24 = 0;
    objc_msgSend(v19, "mass");
    v26 = v25;
    objc_msgSend(v19, "stiffness");
    v28 = v27;
    objc_msgSend(v19, "damping");
    v30 = v29;
    objc_msgSend(v19, "initialVelocity");
    v32 = v31;

    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __91__BSAnimationSettings_UIKit__tryAnimatingWithSettings_fromCurrentState_actions_completion___block_invoke;
    v40[3] = &unk_1E16B1BF8;
    v41 = v12;
    +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", v24, v40, v13, v21, v23, v26, v28, v30, v32);
    v33 = v41;
    goto LABEL_8;
  }
  if (v18)
  {
    v34 = objc_alloc_init(_UISceneSettingsMediaTimingAnimationFactory);
    -[_UISceneSettingsMediaTimingAnimationFactory set_timingFunctionForAnimation:](v34, "set_timingFunctionForAnimation:", v18);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __91__BSAnimationSettings_UIKit__tryAnimatingWithSettings_fromCurrentState_actions_completion___block_invoke_2;
    v38[3] = &unk_1E16B1BF8;
    v39 = v12;
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v34, v38, v13, v15, v17);

    goto LABEL_11;
  }
  if (v15 > 0.0)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __91__BSAnimationSettings_UIKit__tryAnimatingWithSettings_fromCurrentState_actions_completion___block_invoke_3;
    v36[3] = &unk_1E16B1BF8;
    v37 = v12;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v36, v13, v15, v17);
    v33 = v37;
LABEL_8:

    goto LABEL_11;
  }
  (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  if (v13)
    v13[2](v13, 1);
LABEL_11:

}

+ (uint64_t)tryAnimatingWithSettings:()UIKit actions:completion:
{
  return objc_msgSend(a1, "tryAnimatingWithSettings:fromCurrentState:actions:completion:", a3, 0, a4, a5);
}

@end
