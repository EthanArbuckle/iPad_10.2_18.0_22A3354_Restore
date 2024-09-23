@implementation SBHStackConfigurationFadeAnimator

- (SBHStackConfigurationFadeAnimator)init
{
  SBHStackConfigurationFadeAnimator *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BSAnimationSettings *animationSettings;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHStackConfigurationFadeAnimator;
  v2 = -[SBHStackConfigurationFadeAnimator init](&v10, sel_init);
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
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  objc_msgSend(a4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widgetStackMatchingBackgroundView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__SBHStackConfigurationFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke;
  v10[3] = &unk_1E8D865D8;
  v11 = v6;
  v12 = a3;
  v10[4] = self;
  v8 = v6;
  objc_msgSend(v7, "performWithoutAnimation:", v10);

}

uint64_t __78__SBHStackConfigurationFadeAnimator_prepareToAnimateFromEndpoint_withContext___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateSourceSnapshotViewUsingSourceIconView:withCoordinator:", 1, *(_QWORD *)(a1 + 40));
    v2 = *(_QWORD *)(a1 + 48);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_configureForEndpoint:withCoordinator:", v2, *(_QWORD *)(a1 + 40));
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
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  void *v21;
  int64_t v22;
  _QWORD v23[4];
  void (**v24)(_QWORD);
  _QWORD v25[5];
  void *v26;
  int64_t v27;
  _QWORD v28[5];
  id v29;

  v8 = (void (**)(_QWORD))a5;
  v9 = a4;
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "wantsAnimation");

  if (v11)
  {
    if (-[SBHStackConfigurationFadeAnimator isAlreadyAnimating](self, "isAlreadyAnimating"))
      v12 = (2 * (a3 == 1)) | 4;
    else
      v12 = 2 * (a3 == 1);
    -[SBHStackConfigurationFadeAnimator setAlreadyAnimating:](self, "setAlreadyAnimating:", 1);
    if (a3 != 1)
    {
      v13 = (void *)MEMORY[0x1E0DC3F10];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke;
      v28[3] = &unk_1E8D84EF0;
      v28[4] = self;
      v29 = v10;
      objc_msgSend(v13, "performWithoutAnimation:", v28);

    }
    v14 = (void *)MEMORY[0x1E0D01908];
    -[SBHStackConfigurationFadeAnimator animationSettings](self, "animationSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2;
    v25[3] = &unk_1E8D865D8;
    v26 = v10;
    v27 = a3;
    v25[4] = self;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3;
    v23[3] = &unk_1E8D86600;
    v24 = v8;
    v16 = v10;
    objc_msgSend(v14, "animateWithSettings:options:actions:completion:", v15, v12, v25, v23);

    v17 = v26;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0DC3F10];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_4;
    v20[3] = &unk_1E8D865D8;
    v21 = v10;
    v22 = a3;
    v20[4] = self;
    v19 = v10;
    objc_msgSend(v18, "performWithoutAnimation:", v20);
    if (v8)
      v8[2](v8);
    v17 = v21;
  }

}

void __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_updateSourceSnapshotViewUsingSourceIconView:withCoordinator:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "sourceSnapshotView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "sourceIconView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_setupMatchMoveAnimationWithSourceView:targetView:", v3, v4);

  }
}

uint64_t __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __78__SBHStackConfigurationFadeAnimator_animateToEndpoint_withContext_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
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
  -[SBHStackConfigurationFadeAnimator setAlreadyAnimating:](self, "setAlreadyAnimating:", 0);
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__SBHStackConfigurationFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke;
  v9[3] = &unk_1E8D865D8;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  objc_msgSend(v7, "performWithoutAnimation:", v9);

}

uint64_t __77__SBHStackConfigurationFadeAnimator_finalizeAnimationAtEndpoint_withContext___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_configureForEndpoint:withCoordinator:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "sourceSnapshotView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setSourceSnapshotView:", 0);
}

- (void)_configureForEndpoint:(int64_t)a3 withCoordinator:(id)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3 == 1)
    v8 = 1.0;
  else
    v8 = 0.0;
  objc_msgSend(v6, "fadingViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widgetContentContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setByAddingObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "materialViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "setWeighting:", v8);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v14);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = v11;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "setAlpha:", v8, (_QWORD)v27);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

  if (a3 == 1)
    v22 = 0.0;
  else
    v22 = 1.0;
  objc_msgSend(v7, "sourceIconView", (_QWORD)v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "customIconImageViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setAlpha:", v22);
  -[SBHStackConfigurationFadeAnimator sourceSnapshotView](self, "sourceSnapshotView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAlpha:", v22);

}

- (void)_updateSourceSnapshotViewUsingSourceIconView:(BOOL)a3 withCoordinator:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v4 = a3;
  v27 = a4;
  -[SBHStackConfigurationFadeAnimator sourceSnapshotView](self, "sourceSnapshotView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "removeFromSuperview");
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentationLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v7, "layer");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v11;

    objc_msgSend(v13, "opacity");
    v12 = v14;

  }
  else
  {
    v12 = 0.0;
  }
  objc_msgSend(v27, "sourceIconView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v4)
    objc_msgSend(v15, "iconImageSnapshotView");
  else
    objc_msgSend(v27, "visiblyActiveDataSourceSnapshotView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHStackConfigurationFadeAnimator setSourceSnapshotView:](self, "setSourceSnapshotView:", v17);
  if (v17)
  {
    objc_msgSend(v27, "configurationView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "iconImageFrame");
    objc_msgSend(v16, "convertRect:toView:", v18);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(v18, "insertSubview:atIndex:", v17, 0);
    objc_msgSend(v17, "setFrame:", v20, v22, v24, v26);
    objc_msgSend(v17, "setAlpha:", v12);

  }
}

- (void)_setupMatchMoveAnimationWithSourceView:(id)a3 targetView:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CD27C0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "animation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceLayer:", v9);

  objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v8, "setRemovedOnCompletion:", 0);
  objc_msgSend(v8, "setDuration:", INFINITY);
  objc_msgSend(v8, "setAppliesY:", 1);
  objc_msgSend(v8, "setAppliesX:", 1);
  objc_msgSend(v6, "bounds");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v7, "bounds");
  objc_msgSend(v7, "convertRect:toView:", v6);
  v15 = v14;
  v17 = v16;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v11 * 0.5 - v15, v13 * 0.5 - v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourcePoints:", v19);

  objc_msgSend(v6, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "addAnimation:forKey:", v8, 0);
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

- (UIView)sourceSnapshotView
{
  return self->_sourceSnapshotView;
}

- (void)setSourceSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceSnapshotView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceSnapshotView, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end
