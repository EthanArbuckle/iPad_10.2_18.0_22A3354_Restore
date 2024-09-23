@implementation SBFHomeAffordanceView

- (SBFHomeAffordanceView)initWithFrame:(CGRect)a3
{
  SBFHomeAffordanceView *v3;
  uint64_t v4;
  SBFHomeGrabberSettings *homeGrabberSettings;
  void *v6;
  uint64_t v7;
  SBFSiriSystemAssistantExperienceSettings *systemAssistantExperienceSettings;
  id v9;
  void *v10;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBFHomeAffordanceView;
  v3 = -[SBFHomeAffordanceView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[SBFHomeGrabberDomain rootSettings](SBFHomeGrabberDomain, "rootSettings");
    v4 = objc_claimAutoreleasedReturnValue();
    homeGrabberSettings = v3->_homeGrabberSettings;
    v3->_homeGrabberSettings = (SBFHomeGrabberSettings *)v4;

    +[SBFSiriDomain rootSettings](SBFSiriDomain, "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemAssistantExperienceSettings");
    v7 = objc_claimAutoreleasedReturnValue();
    systemAssistantExperienceSettings = v3->_systemAssistantExperienceSettings;
    v3->_systemAssistantExperienceSettings = (SBFSiriSystemAssistantExperienceSettings *)v7;

    v9 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v10 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v12.receiver = v3;
    v12.super_class = (Class)SBFHomeAffordanceView;
    -[SBFHomeAffordanceView addSubview:](&v12, sel_addSubview_, v10);
    objc_storeWeak((id *)&v3->_topLevelContainerView, v10);

  }
  return v3;
}

- (void)setHintStyle:(unint64_t)a3
{
  char v3;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (self->_hintStyle != a3)
  {
    v3 = a3;
    self->_hintStyle = a3;
    -[SBFHomeAffordanceView visualEffectView](self, "visualEffectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v3 & 2) == 0 || v5)
    {
      if ((v3 & 2) != 0 || !v5)
        goto LABEL_9;
      v9 = v5;
      objc_msgSend(v5, "removeFromSuperview");
      v7 = 0;
    }
    else
    {
      v6 = objc_alloc(MEMORY[0x1E0CEABE8]);
      v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[SBFHomeAffordanceView topLevelContainerView](self, "topLevelContainerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v7);

      v9 = (id)v7;
    }
    -[SBFHomeAffordanceView setVisualEffectView:](self, "setVisualEffectView:", v7);
    v5 = v9;
LABEL_9:

  }
}

- (void)addContentView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SBFHomeAffordanceView contentViewContainerView](self, "contentViewContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v4 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[SBFHomeAffordanceView topLevelContainerView](self, "topLevelContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v4);

    -[SBFHomeAffordanceView setContentViewContainerView:](self, "setContentViewContainerView:", v4);
  }
  objc_msgSend(v4, "addSubview:", v7);

}

- (void)insertContentView:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SBFHomeAffordanceView contentViewContainerView](self, "contentViewContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v6 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[SBFHomeAffordanceView topLevelContainerView](self, "topLevelContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v6);

    -[SBFHomeAffordanceView setContentViewContainerView:](self, "setContentViewContainerView:", v6);
  }
  objc_msgSend(v6, "insertSubview:atIndex:", v9, a4);

}

- (void)removeContentView:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[SBFHomeAffordanceView contentViewContainerView](self, "contentViewContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
    objc_msgSend(v9, "removeFromSuperview");
  objc_msgSend(v4, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    objc_msgSend(v4, "removeFromSuperview");
    -[SBFHomeAffordanceView setContentViewContainerView:](self, "setContentViewContainerView:", 0);
  }

}

- (void)performHintAnimation
{
  -[SBFHomeAffordanceView performHintAnimationWithCompletionHandler:](self, "performHintAnimationWithCompletionHandler:", &__block_literal_global_23);
}

- (void)performHintAnimationWithCompletionHandler:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD v12[3];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v5 = -[SBFHomeAffordanceView hintStyle](self, "hintStyle");
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__SBFHomeAffordanceView_performHintAnimationWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E200F3D8;
  v10 = &v14;
  v11 = v12;
  v6 = v4;
  v9 = v6;
  v7 = (void *)MEMORY[0x18D774178](v8);
  if ((v5 & 6) == 0)
  {
    if ((v5 & 1) != 0)
    {
      ++v15[3];
      -[SBFHomeAffordanceView _performBounceAnimationWithCompletionHandler:](self, "_performBounceAnimationWithCompletionHandler:", v7);
    }
    else
    {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
    goto LABEL_14;
  }
  if ((v5 & 2) == 0)
  {
    if ((v5 & 4) == 0)
      goto LABEL_4;
LABEL_9:
    ++v15[3];
    if ((v5 & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  ++v15[3];
  if ((v5 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 2) != 0)
LABEL_10:
    -[SBFHomeAffordanceView _performGlowAnimationWithCompletionHandler:](self, "_performGlowAnimationWithCompletionHandler:", v7);
LABEL_11:
  if ((v5 & 4) != 0)
    -[SBFHomeAffordanceView _performPulseAnimationWithCompletionHandler:](self, "_performPulseAnimationWithCompletionHandler:", v7);
LABEL_14:

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);

}

_QWORD *__67__SBFHomeAffordanceView_performHintAnimationWithCompletionHandler___block_invoke(_QWORD *result, char a2)
{
  uint64_t v2;
  char v3;

  --*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
  v2 = *(_QWORD *)(result[6] + 8);
  if (*(_BYTE *)(v2 + 24))
    v3 = a2;
  else
    v3 = 0;
  *(_BYTE *)(v2 + 24) = v3;
  if (*(uint64_t *)(*(_QWORD *)(result[5] + 8) + 24) <= 0)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(result[4] + 16))(result[4], *(unsigned __int8 *)(*(_QWORD *)(result[6] + 8) + 24));
  return result;
}

- (void)cancelHintAnimation
{
  -[SBFHomeAffordanceView cancelHintAnimationWithCompletionHandler:](self, "cancelHintAnimationWithCompletionHandler:", &__block_literal_global_6_1);
}

- (void)cancelHintAnimationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  -[SBFHomeAffordanceView _incrementBounceAnimationGenerationCount](self, "_incrementBounceAnimationGenerationCount");
  -[SBFHomeAffordanceView _incrementGlowAnimationGenerationCount](self, "_incrementGlowAnimationGenerationCount");
  -[SBFHomeAffordanceView _incrementPulseAnimationGenerationCount](self, "_incrementPulseAnimationGenerationCount");
  -[SBFHomeAffordanceView topLevelContainerView](self, "topLevelContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFHomeAffordanceView visualEffectView](self, "visualEffectView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFSiriSystemAssistantExperienceSettings homeAffordanceHintCancellationAnimationSettings](self->_systemAssistantExperienceSettings, "homeAffordanceHintCancellationAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEABB0];
  v13 = v4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__SBFHomeAffordanceView_cancelHintAnimationWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E200E2A0;
  v15 = v6;
  v16 = v5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__SBFHomeAffordanceView_cancelHintAnimationWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E200F400;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v8, "sb_animateWithSettings:mode:animations:completion:", v7, 3, v14, v12);

}

uint64_t __66__SBFHomeAffordanceView_cancelHintAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);
  v2 = *(void **)(a1 + 40);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

uint64_t __66__SBFHomeAffordanceView_cancelHintAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;

  v26 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)SBFHomeAffordanceView;
  -[SBFHomeAffordanceView layoutSubviews](&v24, sel_layoutSubviews);
  -[SBFHomeAffordanceView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBFHomeAffordanceView topLevelContainerView](self, "topLevelContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  UIRectGetCenter();
  objc_msgSend(v11, "setCenter:");
  -[SBFHomeAffordanceView visualEffectView](self, "visualEffectView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "bounds");
    objc_msgSend(v12, "setFrame:");
    objc_msgSend(v11, "bounds");
    objc_msgSend(v12, "_setCornerRadius:", CGRectGetHeight(v27) * 0.5);
    objc_msgSend(v11, "bringSubviewToFront:", v12);
  }
  -[SBFHomeAffordanceView contentViewContainerView](self, "contentViewContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v11, "bounds");
    objc_msgSend(v13, "setFrame:");
    objc_msgSend(v11, "sendSubviewToBack:", v13);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v13, "subviews", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18);
          objc_msgSend(v13, "bounds");
          objc_msgSend(v19, "setFrame:");
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v16);
    }

  }
}

- (int64_t)_incrementBounceAnimationGenerationCount
{
  int64_t v3;

  v3 = -[SBFHomeAffordanceView bounceAnimationGenerationCount](self, "bounceAnimationGenerationCount") + 1;
  -[SBFHomeAffordanceView setBounceAnimationGenerationCount:](self, "setBounceAnimationGenerationCount:", v3);
  return v3;
}

- (int64_t)_incrementGlowAnimationGenerationCount
{
  int64_t v3;

  v3 = -[SBFHomeAffordanceView glowAnimationGenerationCount](self, "glowAnimationGenerationCount") + 1;
  -[SBFHomeAffordanceView setGlowAnimationGenerationCount:](self, "setGlowAnimationGenerationCount:", v3);
  return v3;
}

- (int64_t)_incrementPulseAnimationGenerationCount
{
  int64_t v3;

  v3 = -[SBFHomeAffordanceView pulseAnimationGenerationCount](self, "pulseAnimationGenerationCount") + 1;
  -[SBFHomeAffordanceView setPulseAnimationGenerationCount:](self, "setPulseAnimationGenerationCount:", v3);
  return v3;
}

- (void)_performBounceAnimationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  double v13;
  dispatch_time_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22[2];
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v4 = a3;
  -[SBFHomeAffordanceView homeGrabberSettings](self, "homeGrabberSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = -[SBFHomeAffordanceView _incrementBounceAnimationGenerationCount](self, "_incrementBounceAnimationGenerationCount");
  -[SBFHomeAffordanceView topLevelContainerView](self, "topLevelContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounceAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CEABB0];
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke;
  v23[3] = &unk_1E200E2A0;
  v11 = v7;
  v24 = v11;
  v12 = v5;
  v25 = v12;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v8, 3, v23, 0);
  objc_msgSend(v12, "bounceReverseAnimationDelay");
  v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke_2;
  v18[3] = &unk_1E200F428;
  objc_copyWeak(v22, &location);
  v19 = v8;
  v20 = v11;
  v22[1] = v6;
  v21 = v4;
  v15 = v4;
  v16 = v11;
  v17 = v8;
  dispatch_after(v14, MEMORY[0x1E0C80D38], v18);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

}

uint64_t __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  CGAffineTransform v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bounceTranslation");
  CGAffineTransformMakeTranslation(&v4, 0.0, -v2);
  return objc_msgSend(v1, "setTransform:", &v4);
}

void __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_msgSend(WeakRetained, "bounceAnimationGenerationCount");
  v4 = *(_QWORD *)(a1 + 64);

  if (v3 == v4)
  {
    v5 = (void *)MEMORY[0x1E0CEABB0];
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E200E188;
    v7 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke_4;
    v8[3] = &unk_1E200F400;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v5, "sb_animateWithSettings:mode:animations:completion:", v7, 3, v10, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performGlowAnimationWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint32_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  double v35;
  dispatch_time_t v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  id v48[2];
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  id location[2];

  v43 = a3;
  -[SBFHomeAffordanceView systemAssistantExperienceSettings](self, "systemAssistantExperienceSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CEACF0]);
  objc_msgSend(MEMORY[0x1E0CEA478], "sbf_siriIntelligenceLightColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = arc4random_uniform(v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  if (v7)
  {
    v10 = v8;
    v11 = v7;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v10 % v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v12);

      ++v10;
      --v11;
    }
    while (v11);
  }

  v13 = objc_msgSend(v5, "initWithColors:", v9);
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEACE8]), "initWithPalette:", v13);
  objc_msgSend(MEMORY[0x1E0CEAD90], "directionalLightWithConfiguration:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CEAD88]);
  objc_msgSend(v4, "homeAffordanceGlowInnerLightRadius");
  v17 = (void *)objc_msgSend(v16, "initWithLightSource:radius:region:", v15, 0);
  objc_msgSend(v17, "setActivationTransitionDirection:", 2);
  v18 = objc_alloc(MEMORY[0x1E0CEAD88]);
  objc_msgSend(v4, "homeAffordanceGlowOuterLightRadius");
  v42 = (void *)v15;
  v19 = (void *)objc_msgSend(v18, "initWithLightSource:radius:region:", v15, 1);
  objc_msgSend(v19, "setActivationTransitionDirection:", 2);
  v20 = objc_alloc(MEMORY[0x1E0CEAD98]);
  objc_msgSend(v4, "homeAffordanceGlowHighlightThickness");
  v22 = v21;
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeAffordanceGlowHighlightRadius");
  v25 = (void *)objc_msgSend(v20, "initWithThickness:color:softRadius:region:activationDirection:", v23, 2, 2, v22, v24);

  objc_initWeak(location, self);
  v26 = -[SBFHomeAffordanceView _incrementGlowAnimationGenerationCount](self, "_incrementGlowAnimationGenerationCount");
  v41 = (void *)v14;
  -[SBFHomeAffordanceView visualEffectView](self, "visualEffectView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)v13;
  objc_msgSend(v4, "homeAffordanceGlowAnimationSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0CEABB0];
  v30 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke;
  v49[3] = &unk_1E200E318;
  v31 = v27;
  v50 = v31;
  v32 = v17;
  v51 = v32;
  v33 = v19;
  v52 = v33;
  v34 = v25;
  v53 = v34;
  objc_msgSend(v29, "sb_animateWithSettings:mode:animations:completion:", v28, 3, v49, 0);
  objc_msgSend(v4, "homeAffordanceGlowReverseAnimationDelay");
  v36 = dispatch_time(0, (uint64_t)(v35 * 1000000000.0));
  block[0] = v30;
  block[1] = 3221225472;
  block[2] = __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E200F428;
  objc_copyWeak(v48, location);
  v45 = v28;
  v46 = v31;
  v48[1] = v26;
  v47 = v43;
  v37 = v43;
  v38 = v31;
  v39 = v28;
  dispatch_after(v36, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v48);
  objc_destroyWeak(location);

}

void __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundEffects:", v2);

}

void __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_msgSend(WeakRetained, "glowAnimationGenerationCount");
  v4 = *(_QWORD *)(a1 + 64);

  if (v3 == v4)
  {
    v5 = (void *)MEMORY[0x1E0CEABB0];
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E200E188;
    v7 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke_4;
    v8[3] = &unk_1E200F400;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v5, "sb_animateWithSettings:mode:animations:completion:", v7, 3, v10, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);
}

uint64_t __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performPulseAnimationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  double v13;
  dispatch_time_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22[2];
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v4 = a3;
  -[SBFHomeAffordanceView systemAssistantExperienceSettings](self, "systemAssistantExperienceSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = -[SBFHomeAffordanceView _incrementPulseAnimationGenerationCount](self, "_incrementPulseAnimationGenerationCount");
  -[SBFHomeAffordanceView topLevelContainerView](self, "topLevelContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeAffordancePulseAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CEABB0];
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke;
  v23[3] = &unk_1E200E2A0;
  v11 = v7;
  v24 = v11;
  v12 = v5;
  v25 = v12;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v8, 3, v23, 0);
  objc_msgSend(v12, "homeAffordancePulseReverseAnimationDelay");
  v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke_2;
  v18[3] = &unk_1E200F428;
  objc_copyWeak(v22, &location);
  v19 = v8;
  v20 = v11;
  v22[1] = v6;
  v21 = v4;
  v15 = v4;
  v16 = v11;
  v17 = v8;
  dispatch_after(v14, MEMORY[0x1E0C80D38], v18);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

}

uint64_t __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  CGFloat v4;
  CGFloat v5;
  CGAffineTransform v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "homeAffordancePulseXScale");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "homeAffordancePulseYScale");
  CGAffineTransformMakeScale(&v7, v4, v5);
  return objc_msgSend(v2, "setTransform:", &v7);
}

void __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_msgSend(WeakRetained, "pulseAnimationGenerationCount");
  v4 = *(_QWORD *)(a1 + 64);

  if (v3 == v4)
  {
    v5 = (void *)MEMORY[0x1E0CEABB0];
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E200E188;
    v7 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke_4;
    v8[3] = &unk_1E200F400;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v5, "sb_animateWithSettings:mode:animations:completion:", v7, 3, v10, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)hintStyle
{
  return self->_hintStyle;
}

- (SBFHomeGrabberSettings)homeGrabberSettings
{
  return self->_homeGrabberSettings;
}

- (SBFSiriSystemAssistantExperienceSettings)systemAssistantExperienceSettings
{
  return self->_systemAssistantExperienceSettings;
}

- (UIView)topLevelContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_topLevelContainerView);
}

- (void)setTopLevelContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_topLevelContainerView, a3);
}

- (UIVisualEffectView)visualEffectView
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_visualEffectView);
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeWeak((id *)&self->_visualEffectView, a3);
}

- (UIView)contentViewContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentViewContainerView);
}

- (void)setContentViewContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_contentViewContainerView, a3);
}

- (int64_t)bounceAnimationGenerationCount
{
  return self->_bounceAnimationGenerationCount;
}

- (void)setBounceAnimationGenerationCount:(int64_t)a3
{
  self->_bounceAnimationGenerationCount = a3;
}

- (int64_t)glowAnimationGenerationCount
{
  return self->_glowAnimationGenerationCount;
}

- (void)setGlowAnimationGenerationCount:(int64_t)a3
{
  self->_glowAnimationGenerationCount = a3;
}

- (int64_t)pulseAnimationGenerationCount
{
  return self->_pulseAnimationGenerationCount;
}

- (void)setPulseAnimationGenerationCount:(int64_t)a3
{
  self->_pulseAnimationGenerationCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentViewContainerView);
  objc_destroyWeak((id *)&self->_visualEffectView);
  objc_destroyWeak((id *)&self->_topLevelContainerView);
  objc_storeStrong((id *)&self->_systemAssistantExperienceSettings, 0);
  objc_storeStrong((id *)&self->_homeGrabberSettings, 0);
}

@end
