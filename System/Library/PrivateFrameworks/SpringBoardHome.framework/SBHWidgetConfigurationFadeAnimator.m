@implementation SBHWidgetConfigurationFadeAnimator

- (SBHWidgetConfigurationFadeAnimator)init
{
  SBHWidgetConfigurationFadeAnimator *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BSAnimationSettings *animationSettings;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHWidgetConfigurationFadeAnimator;
  v2 = -[SBHWidgetConfigurationFadeAnimator init](&v10, sel_init);
  if (v2)
  {
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "iconAnimationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "reducedMotionSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "centralAnimationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "BSAnimationSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    animationSettings = v2->_animationSettings;
    v2->_animationSettings = (BSAnimationSettings *)v7;

  }
  return v2;
}

- (void)prepareToAnimateFromEndpoint:(int64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SBHWidgetConfigurationFadeAnimator *v11;
  int64_t v12;

  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__SBHWidgetConfigurationFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v9[3] = &unk_1E8D865D8;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v8 = v6;
  objc_msgSend(v7, "performWithoutAnimation:", v9);

}

void __79__SBHWidgetConfigurationFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "sourceView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "backgroundTintView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSubview:belowSubview:", v8, v5);

  objc_msgSend(*(id *)(a1 + 32), "sourceContentFrame");
  UIRectGetCenter();
  objc_msgSend(v8, "setCenter:");
  objc_msgSend(*(id *)(a1 + 32), "referenceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 40), "_configureForEndpoint:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  void *v24;
  int64_t v25;
  _QWORD v26[4];
  void (**v27)(_QWORD);
  _QWORD v28[5];
  void *v29;
  int64_t v30;

  v8 = (void (**)(_QWORD))a5;
  v9 = a4;
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "wantsAnimation");

  if (v11)
  {
    v12 = 2 * (a3 == 1);
    if (-[SBHWidgetConfigurationFadeAnimator isAlreadyAnimating](self, "isAlreadyAnimating"))
      v12 = (2 * (a3 == 1)) | 4;
    -[SBHWidgetConfigurationFadeAnimator setAlreadyAnimating:](self, "setAlreadyAnimating:", 1);
    objc_msgSend(v10, "targetView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsHitTesting:", a3 == 1);

    objc_msgSend(v10, "backgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsHitTesting:", a3 == 1);

    v17 = (void *)MEMORY[0x1E0D01908];
    -[SBHWidgetConfigurationFadeAnimator animationSettings](self, "animationSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __79__SBHWidgetConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke;
    v28[3] = &unk_1E8D865D8;
    v29 = v10;
    v30 = a3;
    v28[4] = self;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __79__SBHWidgetConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2;
    v26[3] = &unk_1E8D86600;
    v27 = v8;
    v19 = v10;
    objc_msgSend(v17, "animateWithSettings:options:actions:completion:", v18, v12, v28, v26);

    v20 = v29;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0DC3F10];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __79__SBHWidgetConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3;
    v23[3] = &unk_1E8D865D8;
    v24 = v10;
    v25 = a3;
    v23[4] = self;
    v22 = v10;
    objc_msgSend(v21, "performWithoutAnimation:", v23);
    if (v8)
      v8[2](v8);
    v20 = v24;
  }

}

uint64_t __79__SBHWidgetConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureForEndpoint:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __79__SBHWidgetConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __79__SBHWidgetConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureForEndpoint:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  int64_t v16;

  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetConfigurationFadeAnimator setAlreadyAnimating:](self, "setAlreadyAnimating:", 0);
  objc_msgSend(v6, "sourceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  objc_msgSend(v6, "targetView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsHitTesting:", 1);

  objc_msgSend(v6, "backgroundView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowsHitTesting:", 1);

  v12 = (void *)MEMORY[0x1E0DC3F10];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__SBHWidgetConfigurationFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke;
  v14[3] = &unk_1E8D84C78;
  v15 = v6;
  v16 = a3;
  v13 = v6;
  objc_msgSend(v12, "performWithoutAnimation:", v14);

}

void __78__SBHWidgetConfigurationFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "referenceView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v3 = 1.0;
  if (*(_QWORD *)(a1 + 40) == 1)
    v3 = 0.0;
  objc_msgSend(v2, "setAlpha:", v3);

}

- (void)_configureForEndpoint:(int64_t)a3 context:(id)a4
{
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (a3)
    v5 = 1.0;
  else
    v5 = 0.0;
  if (!UIAccessibilityIsReduceTransparencyEnabled())
  {
    objc_msgSend(v10, "sourceView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0 - v5);

  }
  objc_msgSend(v10, "targetView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v5);

  objc_msgSend(v10, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWeighting:", v5);

  objc_msgSend(v10, "backgroundTintView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v5);

}

- (BSAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (BOOL)isAlreadyAnimating
{
  return self->_alreadyAnimating;
}

- (void)setAlreadyAnimating:(BOOL)a3
{
  self->_alreadyAnimating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end
