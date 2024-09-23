@implementation SBIconAnimator

- (SBIconAnimator)initWithAnimationContainer:(id)a3
{
  id v5;
  SBIconAnimator *v6;
  SBIconAnimator *v7;
  NSMutableArray *v8;
  NSMutableArray *pendedAnimationContexts;
  void *v10;
  int v11;
  void *v12;

  v5 = a3;
  v6 = -[SBIconAnimator init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_animationContainer, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendedAnimationContexts = v7->_pendedAnimationContexts;
    v7->_pendedAnimationContexts = v8;

    objc_msgSend(v5, "animationWindow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isRotating");
    v7->_windowIsRotating = v11;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__windowFinishedRotating, *MEMORY[0x1E0DC5620], v10);

    }
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBIconAnimator _invalidateCompletions](self, "_invalidateCompletions");
  v4.receiver = self;
  v4.super_class = (Class)SBIconAnimator;
  -[SBIconAnimator dealloc](&v4, sel_dealloc);
}

- (void)setInvalidated:(BOOL)a3
{
  id WeakRetained;

  if (self->_invalidated != a3)
  {
    self->_invalidated = a3;
    if (a3 && !self->_cleanedUp)
    {
      -[SBIconAnimator cleanup](self, "cleanup");
      -[SBIconAnimator _invalidateCompletions](self, "_invalidateCompletions");
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "iconAnimatorWasInvalidated:", self);

    }
  }
}

- (BOOL)isPastPointOfNoReturn
{
  return 0;
}

- (UIView)referenceView
{
  void *v2;
  void *v3;

  -[SBIconAnimator animationContainer](self, "animationContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (id)centralAnimationFactory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D01908];
  -[SBHIconAnimationSettings centralAnimationSettings](self->_settings, "centralAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BSAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "factoryWithSettings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAllowsAdditiveAnimations:", 1);
  return v5;
}

- (void)prepare
{
  if (!self->_invalidated && !self->_windowIsRotating && !self->_startAnimationAfterRotationEnds)
    -[SBIconAnimator _prepareAnimation](self, "_prepareAnimation");
}

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  if (self->_invalidated || self->_windowIsRotating || self->_startAnimationAfterRotationEnds)
    self->_fraction = a3;
  else
    -[SBIconAnimator _setAnimationFraction:](self, "_setAnimationFraction:", a3);
}

- (BOOL)isAnimating
{
  return self->_animationCount != 0;
}

- (void)animateToFraction:(double)a3 afterDelay:(double)a4 withCompletion:(id)a5
{
  id v8;
  SBIconAnimationContext *v9;
  _QWORD block[4];
  id v11;

  v8 = a5;
  if (-[SBIconAnimator invalidated](self, "invalidated"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SBIconAnimator_animateToFraction_afterDelay_withCompletion___block_invoke;
    block[3] = &unk_1E8D859C0;
    v11 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v9 = objc_alloc_init(SBIconAnimationContext);
    -[SBIconAnimationContext setFraction:](v9, "setFraction:", a3);
    -[SBIconAnimationContext setDelay:](v9, "setDelay:", a4);
    -[SBIconAnimationContext setCompletion:](v9, "setCompletion:", v8);
    if (self->_windowIsRotating || self->_startAnimationAfterRotationEnds)
    {
      -[NSMutableArray addObject:](self->_pendedAnimationContexts, "addObject:", v9);
      self->_startAnimationAfterRotationEnds = 1;
    }
    else
    {
      -[SBIconAnimator _animateToFractionFromContext:](self, "_animateToFractionFromContext:", v9);
    }

  }
}

uint64_t __62__SBIconAnimator_animateToFraction_afterDelay_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)cleanup
{
  UIView *backgroundDarkeningView;

  -[SBIconAnimator _setAnimationFraction:](self, "_setAnimationFraction:", 0.0);
  -[SBIconAnimator _cleanupAnimation](self, "_cleanupAnimation");
  -[UIView removeFromSuperview](self->_backgroundDarkeningView, "removeFromSuperview");
  backgroundDarkeningView = self->_backgroundDarkeningView;
  self->_backgroundDarkeningView = 0;

}

- (void)_animateToFractionFromPendingContexts
{
  void *v3;
  SBIconAnimationContext *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray lastObject](self->_pendedAnimationContexts, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SBIconAnimationContext);
  objc_msgSend(v3, "fraction");
  -[SBIconAnimationContext setFraction:](v4, "setFraction:");
  v16 = v3;
  objc_msgSend(v3, "delay");
  -[SBIconAnimationContext setDelay:](v4, "setDelay:");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_pendedAnimationContexts, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_pendedAnimationContexts;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "completion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = _Block_copy(v12);
          objc_msgSend(v5, "addObject:", v14);

          objc_msgSend(v11, "setCompletion:", 0);
        }

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__SBIconAnimator__animateToFractionFromPendingContexts__block_invoke;
  v17[3] = &unk_1E8D84F68;
  v18 = v5;
  v15 = v5;
  -[SBIconAnimationContext setCompletion:](v4, "setCompletion:", v17);
  -[NSMutableArray removeAllObjects](self->_pendedAnimationContexts, "removeAllObjects");
  -[SBIconAnimator _animateToFractionFromContext:](self, "_animateToFractionFromContext:", v4);

}

void __55__SBIconAnimator__animateToFractionFromPendingContexts__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_animateToFractionFromContext:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  uint64_t *v13;
  _QWORD block[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v22 = -[SBIconAnimator _numberOfSignificantAnimations](self, "_numberOfSignificantAnimations");
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 1;
  if (v20[3])
  {
    objc_msgSend(v4, "fraction");
    v6 = v5;
    objc_msgSend(v4, "delay");
    v8 = v7;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__SBIconAnimator__animateToFractionFromContext___block_invoke_2;
    v10[3] = &unk_1E8D8D590;
    v12 = v17;
    v13 = &v19;
    v10[4] = self;
    v11 = v4;
    -[SBIconAnimator _animateToFraction:afterDelay:withSharedCompletion:](self, "_animateToFraction:afterDelay:withSharedCompletion:", v10, v6, v8);
    v9 = v11;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__SBIconAnimator__animateToFractionFromContext___block_invoke;
    block[3] = &unk_1E8D8D568;
    v15 = v4;
    v16 = v17;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v9 = v15;
  }

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

}

void __48__SBIconAnimator__animateToFractionFromContext___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2](v2, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v2 = (void (**)(_QWORD, _QWORD))v3;
  }

}

void __48__SBIconAnimator__animateToFractionFromContext___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 24);
    if (v4)
      *(_QWORD *)(v3 + 24) = v4 - 1;
    objc_msgSend(*(id *)(a1 + 40), "completion");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      v5[2](v5, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      v5 = (void (**)(_QWORD, _QWORD))v6;
    }

  }
}

- (BOOL)_isDelayedForRotation
{
  return self->_windowIsRotating;
}

- (void)_cleanupAnimation
{
  self->_cleanedUp = 1;
  self->_animationCount = 0;
}

- (unint64_t)_numberOfSignificantAnimations
{
  return 0;
}

- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5
{
  ++self->_animationCount;
}

- (void)_invalidateCompletions
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_pendedAnimationContexts;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "completion", (_QWORD)v10);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8)
          (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_pendedAnimationContexts, "removeAllObjects");
}

- (void)_windowFinishedRotating
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC5620];
  -[SBIconAnimator animationContainer](self, "animationContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v6);

  self->_windowIsRotating = 0;
  if (self->_startAnimationAfterRotationEnds)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__SBIconAnimator__windowFinishedRotating__block_invoke;
    block[3] = &unk_1E8D84C50;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __41__SBIconAnimator__windowFinishedRotating__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  objc_msgSend(*(id *)(a1 + 32), "prepare");
  objc_msgSend(*(id *)(a1 + 32), "setFraction:", *(double *)(*(_QWORD *)(a1 + 32) + 8));
  return objc_msgSend(*(id *)(a1 + 32), "_animateToFractionFromPendingContexts");
}

- (SBIconAnimatorDelegate)delegate
{
  return (SBIconAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBHIconAnimationSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (UIView)backgroundDarkeningView
{
  return self->_backgroundDarkeningView;
}

- (void)setBackgroundDarkeningView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundDarkeningView, a3);
}

- (SBIconAnimationContaining)animationContainer
{
  return self->_animationContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationContainer, 0);
  objc_storeStrong((id *)&self->_backgroundDarkeningView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationContext, 0);
  objc_storeStrong((id *)&self->_pendedAnimationContexts, 0);
}

@end
