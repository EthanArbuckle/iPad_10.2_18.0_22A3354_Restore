@implementation SBUISystemApertureElementSourceAnimator

+ (id)activeAnimator
{
  return (id)SBUISystemApertureElementSourceActiveAnimator;
}

+ (void)setActiveAnimator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "activeAnimator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)SBUISystemApertureElementSourceActiveAnimator;
  SBUISystemApertureElementSourceActiveAnimator = (uint64_t)v4;

  v6 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_finishTransition:", 0);
    v6 = v7;
  }

}

- (SBUISystemApertureElementSourceAnimator)initWithSettings:(id)a3 window:(id)a4
{
  id v7;
  id v8;
  SBUISystemApertureElementSourceAnimator *v9;
  SBUISystemApertureElementSourceAnimator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUISystemApertureElementSourceAnimator;
  v9 = -[SBUISystemApertureElementSourceAnimator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_settings, a3);
    objc_storeWeak((id *)&v10->_window, v8);
  }

  return v10;
}

- (void)addPreflightAction:(id)a3
{
  id v4;
  NSMutableArray *preflightActions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v4 = a3;
  preflightActions = self->_preflightActions;
  v9 = v4;
  if (!preflightActions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_preflightActions;
    self->_preflightActions = v6;

    preflightActions = self->_preflightActions;
  }
  v8 = (void *)MEMORY[0x1A85A1798]();
  -[NSMutableArray addObject:](preflightActions, "addObject:", v8);

}

- (void)addPostflightAction:(id)a3
{
  id v4;
  NSMutableArray *postflightActions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v4 = a3;
  postflightActions = self->_postflightActions;
  v9 = v4;
  if (!postflightActions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_postflightActions;
    self->_postflightActions = v6;

    postflightActions = self->_postflightActions;
  }
  v8 = (void *)MEMORY[0x1A85A1798]();
  -[NSMutableArray addObject:](postflightActions, "addObject:", v8);

}

- (void)addPreAlongsideAnimation:(id)a3
{
  id v4;
  NSMutableArray *preAlongsideAnimations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v4 = a3;
  preAlongsideAnimations = self->_preAlongsideAnimations;
  v9 = v4;
  if (!preAlongsideAnimations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_preAlongsideAnimations;
    self->_preAlongsideAnimations = v6;

    preAlongsideAnimations = self->_preAlongsideAnimations;
  }
  v8 = (void *)MEMORY[0x1A85A1798]();
  -[NSMutableArray addObject:](preAlongsideAnimations, "addObject:", v8);

}

- (void)addPostAlongsideAnimation:(id)a3
{
  id v4;
  NSMutableArray *postAlongsideAnimations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v4 = a3;
  postAlongsideAnimations = self->_postAlongsideAnimations;
  v9 = v4;
  if (!postAlongsideAnimations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_postAlongsideAnimations;
    self->_postAlongsideAnimations = v6;

    postAlongsideAnimations = self->_postAlongsideAnimations;
  }
  v8 = (void *)MEMORY[0x1A85A1798]();
  -[NSMutableArray addObject:](postAlongsideAnimations, "addObject:", v8);

}

- (void)_performAnimation
{
  void *v3;
  NSMutableArray *preAlongsideAnimations;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  NSMutableArray *postAlongsideAnimations;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_preAlongsideAnimations, "copy");
  preAlongsideAnimations = self->_preAlongsideAnimations;
  self->_preAlongsideAnimations = 0;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "__runAlongsideAnimations");
  v11 = (void *)-[NSMutableArray copy](self->_postAlongsideAnimations, "copy");
  postAlongsideAnimations = self->_postAlongsideAnimations;
  self->_postAlongsideAnimations = 0;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17) + 16))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17));
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (void)_finishTransition:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  SBUISystemApertureElementSourceAnimator *v6;
  _QWORD v7[5];
  BOOL v8;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  objc_msgSend(WeakRetained, "completeTransition:", v3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__SBUISystemApertureElementSourceAnimator__finishTransition___block_invoke;
  v7[3] = &unk_1E4C3E430;
  v7[4] = self;
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "SBUISA_performWithoutAnimationOrRetargeting:", v7);
  objc_msgSend((id)objc_opt_class(), "activeAnimator");
  v6 = (SBUISystemApertureElementSourceAnimator *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
    objc_msgSend((id)objc_opt_class(), "setActiveAnimator:", 0);

}

void __61__SBUISystemApertureElementSourceAnimator__finishTransition___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)animateTransition:(id)a3
{
  UIWindow **p_window;
  id v5;
  id WeakRetained;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  p_window = &self->_window;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_window);
  objc_storeWeak((id *)&self->_transitionContext, v5);

  objc_msgSend((id)objc_opt_class(), "setActiveAnimator:", self);
  -[SBUISystemApertureElementSourceAnimator settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAnimated");

  if ((v8 & 1) == 0)
    objc_msgSend(WeakRetained, "_removeAllRetargetableAnimations:", 1);
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__SBUISystemApertureElementSourceAnimator_animateTransition___block_invoke;
  v14[3] = &unk_1E4C3E408;
  v14[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "SBUISA_performWithoutAnimationOrRetargeting:", v14);
  v10 = (void *)MEMORY[0x1E0CEABB0];
  -[SBUISystemApertureElementSourceAnimator settings](self, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = self;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __61__SBUISystemApertureElementSourceAnimator_animateTransition___block_invoke_2;
  v13[3] = &unk_1E4C3E408;
  v13[4] = self;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __61__SBUISystemApertureElementSourceAnimator_animateTransition___block_invoke_3;
  v12[3] = &unk_1E4C40660;
  objc_msgSend(v10, "SBUISA_animateWithSettings:animations:completion:", v11, v13, v12);

}

void __61__SBUISystemApertureElementSourceAnimator_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void __61__SBUISystemApertureElementSourceAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "activeAnimator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 32), "_performAnimation");
}

void __61__SBUISystemApertureElementSourceAnimator_animateTransition___block_invoke_3(uint64_t a1, int a2, int a3)
{
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "activeAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
    objc_msgSend(*(id *)(a1 + 32), "_finishTransition:", a2 & ~a3);
}

- (double)transitionDuration:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[SBUISystemApertureElementSourceAnimator settings](self, "settings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fluidBehaviorSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settlingDuration");
  v6 = v5;

  return v6;
}

- (SBUISystemApertureAnimationParameters)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_transitionContext);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_postAlongsideAnimations, 0);
  objc_storeStrong((id *)&self->_preAlongsideAnimations, 0);
  objc_storeStrong((id *)&self->_postflightActions, 0);
  objc_storeStrong((id *)&self->_preflightActions, 0);
}

@end
