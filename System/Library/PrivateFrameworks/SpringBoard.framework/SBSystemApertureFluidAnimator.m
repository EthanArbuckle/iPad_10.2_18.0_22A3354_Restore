@implementation SBSystemApertureFluidAnimator

+ (id)currentAnimationParameters
{
  return (id)SBSystemApertureAnimatorCurrentAnimationParameters;
}

- (SBSystemApertureFluidAnimator)initWithSettings:(id)a3
{
  id v4;
  SBSystemApertureFluidAnimator *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSystemApertureFluidAnimator;
  v5 = -[SBSystemApertureFluidAnimator init](&v7, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0DA9E08]);
      objc_msgSend(v4, "setDefaultValues");
    }
    -[SBSystemApertureAnimator _setSettings:](v5, "_setSettings:", v4);
  }

  return v5;
}

- (SBSystemApertureFluidAnimator)init
{
  return -[SBSystemApertureFluidAnimator initWithSettings:](self, "initWithSettings:", 0);
}

- (void)animateWithMode:(int64_t)a3 animations:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a5;
  v9 = a4;
  -[SBSystemApertureFluidAnimator _fluidBehaviorSettings](self, "_fluidBehaviorSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC680]), "initWithFluidBehaviorSettings:tracking:retargeted:", v10, a3 == 5, a3 == 4);
  objc_storeStrong((id *)&SBSystemApertureAnimatorCurrentAnimationParameters, v11);
  v12 = (void *)MEMORY[0x1E0CEABB0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__SBSystemApertureFluidAnimator_animateWithMode_animations_completion___block_invoke;
  v15[3] = &unk_1E8EA4890;
  v16 = v11;
  v17 = v8;
  v13 = v8;
  v14 = v11;
  objc_msgSend(v12, "sb_animateWithSettings:mode:animations:completion:", v10, a3, v9, v15);

}

uint64_t __71__SBSystemApertureFluidAnimator_animateWithMode_animations_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t result;

  v6 = *(void **)(a1 + 32);
  if (v6 == (void *)SBSystemApertureAnimatorCurrentAnimationParameters)
  {
    SBSystemApertureAnimatorCurrentAnimationParameters = 0;

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

- (void)_animateTransition:(id)a3 actions:(id)a4 completion:(id)a5
{
  -[SBSystemApertureFluidAnimator animateWithMode:animations:completion:](self, "animateWithMode:animations:completion:", 3, a4, a5);
}

- (double)transitionDuration:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[SBSystemApertureFluidAnimator _fluidBehaviorSettings](self, "_fluidBehaviorSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settlingDuration");
  v5 = v4;

  return v5;
}

- (id)_fluidBehaviorSettings
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[SBSystemApertureAnimator _settings](self, "_settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

@end
