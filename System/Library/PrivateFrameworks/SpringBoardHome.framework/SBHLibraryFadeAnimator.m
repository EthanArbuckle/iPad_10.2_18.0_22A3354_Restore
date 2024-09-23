@implementation SBHLibraryFadeAnimator

- (SBHLibraryFadeAnimator)init
{
  SBHLibraryFadeAnimator *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BSAnimationSettings *animationSettings;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHLibraryFadeAnimator;
  v2 = -[SBHLibraryFadeAnimator init](&v10, sel_init);
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
  _QWORD v9[5];
  id v10;
  int64_t v11;

  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__SBHLibraryFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v9[3] = &unk_1E8D865D8;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  objc_msgSend(v7, "performWithoutAnimation:", v9);

}

uint64_t __67__SBHLibraryFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configurePrimaryViewsForEndpoint:finalizing:withContext:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
}

- (void)animateToEndpoint:(int64_t)a3 withContext:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  double v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  void *v32;
  int64_t v33;
  _QWORD v34[5];
  id v35;
  int64_t v36;
  _QWORD v37[4];
  void (**v38)(_QWORD);
  _QWORD v39[5];
  id v40;
  int64_t v41;

  v8 = (void (**)(_QWORD))a5;
  v9 = a4;
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryFadeAnimator animationSettings](self, "animationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "duration");
  v13 = v12;
  if (objc_msgSend(v9, "wantsAnimation"))
    v14 = v13;
  else
    v14 = 0.0;
  objc_msgSend(v10, "noteWillAnimateToEndpoint:withAnimationDuration:", a3, v14);
  v15 = objc_msgSend(v9, "wantsAnimation");

  if (v15)
  {
    if (-[SBHLibraryFadeAnimator isAlreadyAnimating](self, "isAlreadyAnimating"))
      v16 = (2 * (a3 == 1)) | 4;
    else
      v16 = 2 * (a3 == 1);
    -[SBHLibraryFadeAnimator setAlreadyAnimating:](self, "setAlreadyAnimating:", 1);
    v17 = (void *)MEMORY[0x1E0D01908];
    v18 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke;
    v39[3] = &unk_1E8D865D8;
    v39[4] = self;
    v41 = a3;
    v19 = v10;
    v40 = v19;
    v37[0] = v18;
    v37[1] = 3221225472;
    v37[2] = __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2;
    v37[3] = &unk_1E8D86600;
    v38 = v8;
    objc_msgSend(v17, "animateWithSettings:options:actions:completion:", v11, v16, v39, v37);
    v20 = v13 / 3.0;
    v21 = 0x10000;
    v22 = (void *)MEMORY[0x1E0DC3F10];
    v34[0] = v18;
    v23 = v13 / 5.0;
    if (a3 == 1)
      v24 = 0.0;
    else
      v24 = v13 / 3.0;
    if (a3 == 1)
      v21 = 0x20000;
    v34[1] = 3221225472;
    v34[2] = __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3;
    v34[3] = &unk_1E8D865D8;
    v35 = v19;
    v36 = a3;
    if (a3 == 1)
      v25 = v23;
    else
      v25 = v20;
    v26 = v21 | v16;
    v34[4] = self;
    v27 = v19;
    objc_msgSend(v22, "animateWithDuration:delay:options:animations:completion:", v26, v34, 0, v25, v24);

    v28 = v40;
  }
  else
  {
    v29 = (void *)MEMORY[0x1E0DC3F10];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_4;
    v31[3] = &unk_1E8D865D8;
    v32 = v10;
    v33 = a3;
    v31[4] = self;
    v30 = v10;
    objc_msgSend(v29, "performWithoutAnimation:", v31);
    if (v8)
      v8[2](v8);
    v28 = v32;
  }

}

uint64_t __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configurePrimaryViewsForEndpoint:finalizing:withContext:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureIndicatorViewsForEndpoint:withContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __67__SBHLibraryFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configurePrimaryViewsForEndpoint:finalizing:withContext:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_configureIndicatorViewsForEndpoint:withContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)finalizeAnimationAtEndpoint:(int64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryFadeAnimator setAlreadyAnimating:](self, "setAlreadyAnimating:", 0);
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__SBHLibraryFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke;
  v9[3] = &unk_1E8D865D8;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  objc_msgSend(v7, "performWithoutAnimation:", v9);

}

uint64_t __66__SBHLibraryFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configurePrimaryViewsForEndpoint:finalizing:withContext:", *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_configureIndicatorViewsForEndpoint:withContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_configurePrimaryViewsForEndpoint:(int64_t)a3 finalizing:(BOOL)a4 withContext:(id)a5
{
  _BOOL4 v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  id v10;

  v5 = a3 == 1 || a4;
  if (a3 == 1)
    v6 = 1.0;
  else
    v6 = 0.0;
  if (v5)
    v7 = 1.0;
  else
    v7 = 0.0;
  v8 = a5;
  objc_msgSend(v8, "libraryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v7);

  objc_msgSend(v8, "backgroundView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setWeighting:", v6);
}

- (void)_configureIndicatorViewsForEndpoint:(int64_t)a3 withContext:(id)a4
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  if (a3 == 1)
    v4 = 1.0;
  else
    v4 = 0.0;
  if (a3 == 1)
    v5 = 0.0;
  else
    v5 = 1.0;
  objc_msgSend(a4, "libraryIconViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "categoryStackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

  objc_msgSend(v8, "dismissalView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v4);

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
