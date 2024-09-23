@implementation SBSystemApertureAnimator

- (SBSystemApertureAnimator)initWithSettings:(id)a3
{
  id v5;
  SBSystemApertureAnimator *v6;
  SBSystemApertureAnimator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSystemApertureAnimator;
  v6 = -[SBSystemApertureAnimator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_settings, a3);

  return v7;
}

- (void)animateTransition:(id)a3
{
  id *v3;
  id v5;
  char v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  void (**v10)(_QWORD);
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, int, int);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v5 = a3;
  v6 = objc_opt_respondsToSelector();
  v7 = MEMORY[0x1E0C809B0];
  if ((v6 & 1) != 0 && objc_msgSend(v5, "_alongsideAnimationsCount") >= 1)
  {
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __46__SBSystemApertureAnimator_animateTransition___block_invoke;
    v19[3] = &unk_1E8E9DED8;
    v8 = v19;
    v3 = &v20;
    v20 = v5;
    v9 = 1;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  v10 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v8);
  v14 = v7;
  v15 = 3221225472;
  v16 = __46__SBSystemApertureAnimator_animateTransition___block_invoke_2;
  v17 = &unk_1E8EA46E8;
  v11 = v5;
  v18 = v11;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](&v14);
  if (v10)
  {
    if (objc_msgSend(v11, "isAnimated", v14, v15, v16, v17))
    {
      -[SBSystemApertureAnimator transitionDuration:](self, "transitionDuration:", v11);
      if (v13 > 0.0)
      {
        -[SBSystemApertureAnimator _animateTransition:actions:completion:](self, "_animateTransition:actions:completion:", v11, v10, v12);
        goto LABEL_11;
      }
    }
    v10[2](v10);
  }
  v12[2](v12, 1, 0);
LABEL_11:

  if (v9)
}

- (double)transitionDuration:(id)a3
{
  double result;

  objc_msgSend(self->_settings, "duration", a3);
  return result;
}

- (void)_animateTransition:(id)a3 actions:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0D01908];
  v9 = a4;
  -[SBSystemApertureAnimator _bsAnimationSettings](self, "_bsAnimationSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__SBSystemApertureAnimator__animateTransition_actions_completion___block_invoke;
  v12[3] = &unk_1E8E9F1C0;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v8, "animateWithSettings:actions:completion:", v10, v9, v12);

}

- (id)_bsAnimationSettings
{
  id settings;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  settings = self->_settings;
  v3 = objc_opt_class();
  v4 = settings;
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

uint64_t __46__SBSystemApertureAnimator_animateTransition___block_invoke_2(uint64_t a1, int a2, int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2 & ~a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_settings, 0);
}

uint64_t __66__SBSystemApertureAnimator__animateTransition_actions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__SBSystemApertureAnimator_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
  return result;
}

- (id)_settings
{
  return self->_settings;
}

- (void)_setSettings:(id)a3
{
  objc_storeStrong(&self->_settings, a3);
}

@end
