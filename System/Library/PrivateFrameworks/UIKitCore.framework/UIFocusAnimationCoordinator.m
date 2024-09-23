@implementation UIFocusAnimationCoordinator

+ (id)_focusingAnimationCoordinatorWithConfiguration:(id)a3 inContext:(id)a4
{
  return (id)objc_msgSend(a1, "_focusAnimationCoordinatorForAnimationType:withConfiguration:inContext:", 0, a3, a4);
}

+ (id)_unfocusingAnimationCoordinatorWithConfiguration:(id)a3 inContext:(id)a4
{
  return (id)objc_msgSend(a1, "_focusAnimationCoordinatorForAnimationType:withConfiguration:inContext:", 1, a3, a4);
}

+ (id)_focusAnimationCoordinatorForAnimationType:(int64_t)a3 withConfiguration:(id)a4 inContext:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v13;

  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIFocusAnimationCoordinator.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithFocusUpdateContext:", v10);
  objc_msgSend(v11, "_setConfiguration:forFocusAnimation:", v9, a3);
  objc_msgSend(v11, "_prepareForFocusAnimation:", a3);

  return v11;
}

- (UIFocusAnimationCoordinator)init
{
  return (UIFocusAnimationCoordinator *)-[UIFocusAnimationCoordinator _initWithFocusUpdateContext:](self, "_initWithFocusUpdateContext:", 0);
}

- (id)_initWithFocusUpdateContext:(id)a3
{
  id v5;
  UIFocusAnimationCoordinator *v6;
  UIFocusAnimationCoordinator *v7;
  NSMutableArray *v8;
  NSMutableArray *focusingAnimations;
  NSMutableArray *v10;
  NSMutableArray *legacyFocusingAnimations;
  NSMutableArray *v12;
  NSMutableArray *unfocusingAnimations;
  NSMutableArray *v14;
  NSMutableArray *legacyUnfocusingAnimations;
  NSMutableArray *v16;
  NSMutableArray *focusingCompletions;
  NSMutableArray *v18;
  NSMutableArray *unfocusingCompletions;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UIFocusAnimationCoordinator;
  v6 = -[UIFocusAnimationCoordinator init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_focusUpdateContext, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    focusingAnimations = v7->_focusingAnimations;
    v7->_focusingAnimations = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    legacyFocusingAnimations = v7->_legacyFocusingAnimations;
    v7->_legacyFocusingAnimations = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    unfocusingAnimations = v7->_unfocusingAnimations;
    v7->_unfocusingAnimations = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    legacyUnfocusingAnimations = v7->_legacyUnfocusingAnimations;
    v7->_legacyUnfocusingAnimations = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    focusingCompletions = v7->_focusingCompletions;
    v7->_focusingCompletions = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    unfocusingCompletions = v7->_unfocusingCompletions;
    v7->_unfocusingCompletions = v18;

    if (v5)
      -[UIFocusAnimationCoordinator _configureWithFocusUpdateContext:](v7, "_configureWithFocusUpdateContext:", v5);
  }

  return v7;
}

- (void)_configureWithFocusUpdateContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;

  v5 = a3;
  v28 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusAnimationCoordinator.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    v5 = 0;
  }
  objc_msgSend(v5, "previouslyFocusedView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_preferredConfigurationForFocusAnimation:inContext:", 1, v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[UIFocusAnimationCoordinator _setConfiguration:forFocusAnimation:](self, "_setConfiguration:forFocusAnimation:", v7, 1);
  objc_msgSend(v28, "nextFocusedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_preferredConfigurationForFocusAnimation:inContext:", 0, v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v28, "_destinationViewDistanceOffscreen");
    if (v10 > 0.0)
    {
      objc_msgSend(v28, "_request");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "focusSystem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "behavior");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)objc_msgSend(v9, "copy");

        if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD761E0, (uint64_t)CFSTR("AnimationDelayTimeLimit")))v15 = 0.75;
        else
          v15 = *(double *)&qword_1ECD761E8;
        if (_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_907, (uint64_t)CFSTR("AnimationDelayTimeFactor")))v16 = 0.0005;
        else
          v16 = *(double *)&qword_1ECD761C8;
        objc_msgSend(v28, "_destinationViewDistanceOffscreen");
        v18 = v16 * v17;
        v19 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD761D0, (uint64_t)CFSTR("AnimationDelayTimeConstant"));
        v20 = *(double *)&qword_1ECD761D8;
        if (v19)
          v20 = 0.1;
        v21 = fmax(v18 + v20, 0.0);
        if (v15 <= v21)
          v21 = v15;
        objc_msgSend(v14, "setFocusingDelay:", v21);
        if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76200, (uint64_t)CFSTR("AnimationExtraTimeLimit")))v22 = 0.1;
        else
          v22 = *(double *)&qword_1ECD76208;
        if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD761F0, (uint64_t)CFSTR("AnimationExtraTimeFactor")))v23 = 0.0015;
        else
          v23 = *(double *)&qword_1ECD761F8;
        objc_msgSend(v28, "_destinationViewDistanceOffscreen");
        v25 = fmax(v23 * v24, 0.0);
        if (v22 > v25)
          v22 = v25;
        objc_msgSend(v14, "focusingBaseDuration");
        objc_msgSend(v14, "setFocusingBaseDuration:", v26 + v22);
        objc_msgSend(v14, "setFocusingDurationScaleFactorLowerBound:", 1.0);
        objc_msgSend(v14, "setFocusingDurationScaleFactorUpperBound:", 1.0);
        v9 = v14;
      }
    }
    -[UIFocusAnimationCoordinator _setConfiguration:forFocusAnimation:](self, "_setConfiguration:forFocusAnimation:", v9, 0);

  }
}

- (unint64_t)_animationOptions
{
  void *v2;
  unint64_t v3;

  -[UIFocusAnimationCoordinator _activeConfiguration](self, "_activeConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "animationOptions");

  return v3;
}

- (double)_animationDelay
{
  void *v4;
  double v5;
  double v6;

  if (-[UIFocusAnimationCoordinator activeFocusAnimation](self, "activeFocusAnimation"))
    return 0.0;
  -[UIFocusAnimationCoordinator _activeConfiguration](self, "_activeConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusingDelay");
  v6 = v5;

  return v6;
}

- (double)_activeAnimationDuration
{
  double result;

  if (-[UIFocusAnimationCoordinator activeFocusAnimation](self, "activeFocusAnimation"))
  {
    if (-[UIFocusAnimationCoordinator activeFocusAnimation](self, "activeFocusAnimation") == 1)
      -[UIFocusAnimationCoordinator _unfocusingAnimationDuration](self, "_unfocusingAnimationDuration");
    else
      return 0.0;
  }
  else
  {
    -[UIFocusAnimationCoordinator _focusingAnimationDuration](self, "_focusingAnimationDuration");
  }
  return result;
}

- (double)_focusingAnimationDuration
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[UIFocusAnimationCoordinator _activeConfiguration](self, "_activeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "focusingBaseDuration");
  v5 = v4;
  -[UIFocusAnimationCoordinator _activeConfiguration](self, "_activeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFocusAnimationCoordinator _focusUpdateContext](self, "_focusUpdateContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_focusingVelocityBasedDurationScaleFactorForAnimationInContext:", v7);
  v9 = v5 * v8;

  return v9;
}

- (double)_unfocusingAnimationDuration
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[UIFocusAnimationCoordinator _activeConfiguration](self, "_activeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unfocusingBaseDuration");
  v5 = v4;
  -[UIFocusAnimationCoordinator _activeConfiguration](self, "_activeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFocusAnimationCoordinator _focusUpdateContext](self, "_focusUpdateContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_unfocusingVelocityBasedDurationScaleFactorForAnimationInContext:", v7);
  v9 = v5 * v8;

  return v9;
}

- (double)_unfocusingRepositionAnimationDuration
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[UIFocusAnimationCoordinator _activeConfiguration](self, "_activeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unfocusingRepositionBaseDuration");
  v5 = v4;
  -[UIFocusAnimationCoordinator _activeConfiguration](self, "_activeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFocusAnimationCoordinator _focusUpdateContext](self, "_focusUpdateContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_unfocusingRepositionVelocityBasedDurationScaleFactorForAnimationInContext:", v7);
  v9 = v5 * v8;

  return v9;
}

- (void)_setConfiguration:(id)a3 forFocusAnimation:(int64_t)a4
{
  id v6;
  BOOL v7;
  id v8;

  v6 = a3;
  if (v6)
  {
    v8 = v6;
    v7 = -[UIFocusAnimationCoordinator _isLocked](self, "_isLocked");
    v6 = v8;
    if (!v7)
    {
      if (a4)
        -[UIFocusAnimationCoordinator setUnfocusingConfiguration:](self, "setUnfocusingConfiguration:", v8);
      else
        -[UIFocusAnimationCoordinator setFocusingConfiguration:](self, "setFocusingConfiguration:", v8);
      v6 = v8;
    }
  }

}

- (id)_configurationForFocusAnimation:(int64_t)a3
{
  _UIFocusAnimationConfiguration *focusingConfiguration;
  void *v4;

  if (!a3 && self->_focusingConfiguration)
  {
    focusingConfiguration = self->_focusingConfiguration;
    goto LABEL_6;
  }
  focusingConfiguration = self->_unfocusingConfiguration;
  if (focusingConfiguration)
  {
LABEL_6:
    v4 = (void *)-[_UIFocusAnimationConfiguration copy](focusingConfiguration, "copy");
    return v4;
  }
  +[_UIFocusAnimationConfiguration configurationWithStyle:](_UIFocusAnimationConfiguration, "configurationWithStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (_UIFocusAnimationConfiguration)_activeConfiguration
{
  return (_UIFocusAnimationConfiguration *)-[UIFocusAnimationCoordinator _configurationForFocusAnimation:](self, "_configurationForFocusAnimation:", -[UIFocusAnimationCoordinator activeFocusAnimation](self, "activeFocusAnimation"));
}

- (void)_prepareForFocusAnimation:(int64_t)a3
{
  self->_activeFocusAnimation = a3;
  self->_locked = 1;
}

- (void)_consumeBlocks:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  objc_msgSend(v3, "removeAllObjects");

}

- (void)_consumeBlocks:(id)a3 withAnimationContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
  objc_msgSend(v5, "removeAllObjects");

}

- (void)addCoordinatedAnimations:(void *)animations completion:(void *)completion
{
  void *v6;
  id v7;

  v6 = completion;
  v7 = animations;
  -[UIFocusAnimationCoordinator addCoordinatedAnimationsForAnimation:animations:completion:](self, "addCoordinatedAnimationsForAnimation:animations:completion:", -[UIFocusAnimationCoordinator activeFocusAnimation](self, "activeFocusAnimation"), v7, v6);

}

- (void)addCoordinatedAnimationsForAnimation:(int64_t)a3 animations:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id aBlock;

  aBlock = a4;
  v8 = a5;
  if (aBlock)
  {
    v9 = 56;
    if (!a3)
      v9 = 40;
    v10 = *(id *)((char *)&self->super.isa + v9);
    v11 = _Block_copy(aBlock);
    objc_msgSend(v10, "addObject:", v11);

  }
  if (v8)
  {
    v12 = 72;
    if (!a3)
      v12 = 64;
    v13 = *(id *)((char *)&self->super.isa + v12);
    v14 = _Block_copy(v8);
    objc_msgSend(v13, "addObject:", v14);

  }
}

- (void)addCoordinatedFocusingAnimations:(void *)animations completion:(void *)completion
{
  void *v6;
  NSMutableArray *focusingAnimations;
  void *v8;
  NSMutableArray *focusingCompletions;
  void *v10;
  void *aBlock;

  aBlock = animations;
  v6 = completion;
  if (aBlock)
  {
    focusingAnimations = self->_focusingAnimations;
    v8 = _Block_copy(aBlock);
    -[NSMutableArray addObject:](focusingAnimations, "addObject:", v8);

  }
  if (v6)
  {
    focusingCompletions = self->_focusingCompletions;
    v10 = _Block_copy(v6);
    -[NSMutableArray addObject:](focusingCompletions, "addObject:", v10);

  }
}

- (void)addCoordinatedUnfocusingAnimations:(void *)animations completion:(void *)completion
{
  void *v6;
  NSMutableArray *unfocusingAnimations;
  void *v8;
  NSMutableArray *unfocusingCompletions;
  void *v10;
  void *aBlock;

  aBlock = animations;
  v6 = completion;
  if (aBlock)
  {
    unfocusingAnimations = self->_unfocusingAnimations;
    v8 = _Block_copy(aBlock);
    -[NSMutableArray addObject:](unfocusingAnimations, "addObject:", v8);

  }
  if (v6)
  {
    unfocusingCompletions = self->_unfocusingCompletions;
    v10 = _Block_copy(v6);
    -[NSMutableArray addObject:](unfocusingCompletions, "addObject:", v10);

  }
}

- (void)_animate
{
  -[UIFocusAnimationCoordinator _animateFocusAnimation:](self, "_animateFocusAnimation:", -[UIFocusAnimationCoordinator activeFocusAnimation](self, "activeFocusAnimation"));
}

- (void)_animateFocusAnimation:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  _UIFocusAnimationContext *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  _UIFocusAnimationContext *v25;
  id v26;

  -[UIFocusAnimationCoordinator _configurationForFocusAnimation:](self, "_configurationForFocusAnimation:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    -[UIFocusAnimationCoordinator _unfocusingAnimationDuration](self, "_unfocusingAnimationDuration");
    v7 = v6;
    v8 = 0.0;
    v9 = 72;
    v10 = 48;
    v11 = 56;
  }
  else
  {
    -[UIFocusAnimationCoordinator _focusingAnimationDuration](self, "_focusingAnimationDuration");
    v7 = v12;
    objc_msgSend(v5, "focusingDelay");
    v8 = v13;
    v9 = 64;
    v10 = 32;
    v11 = 40;
  }
  v14 = *(id *)((char *)&self->super.isa + v11);
  v15 = *(id *)((char *)&self->super.isa + v10);
  v16 = *(id *)((char *)&self->super.isa + v9);
  v17 = -[_UIFocusAnimationContext initWithDuration:]([_UIFocusAnimationContext alloc], "initWithDuration:", v7);
  if (fabs(v7) < 2.22044605e-16 || _AXSReduceMotionEnabled())
  {
    -[UIFocusAnimationCoordinator _consumeBlocks:](self, "_consumeBlocks:", v14);
    -[UIFocusAnimationCoordinator _consumeBlocks:withAnimationContext:](self, "_consumeBlocks:withAnimationContext:", v15, v17);
    -[UIFocusAnimationCoordinator _consumeBlocks:](self, "_consumeBlocks:", v16);
  }
  else
  {
    v18 = objc_msgSend(v5, "animationOptions");
    if (fabs(v8) >= 2.22044605e-16)
      v19 = v18 | 0x800;
    else
      v19 = v18;
    v20 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __54__UIFocusAnimationCoordinator__animateFocusAnimation___block_invoke;
    v23[3] = &unk_1E16B51E8;
    v23[4] = self;
    v24 = v15;
    v25 = v17;
    v26 = v14;
    v21[0] = v20;
    v21[1] = 3221225472;
    v21[2] = __54__UIFocusAnimationCoordinator__animateFocusAnimation___block_invoke_2;
    v21[3] = &unk_1E16B2218;
    v21[4] = self;
    v22 = v16;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v19, v23, v21, v7, 0.0);

  }
}

uint64_t __54__UIFocusAnimationCoordinator__animateFocusAnimation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_consumeBlocks:withAnimationContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_consumeBlocks:", *(_QWORD *)(a1 + 56));
}

uint64_t __54__UIFocusAnimationCoordinator__animateFocusAnimation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_consumeBlocks:", *(_QWORD *)(a1 + 40));
}

- (void)_cancelFocusAnimation:(int64_t)a3
{
  uint64_t v3;

  v3 = 72;
  if (!a3)
    v3 = 64;
  -[UIFocusAnimationCoordinator _consumeBlocks:](self, "_consumeBlocks:", *(Class *)((char *)&self->super.isa + v3));
}

- (_UIFocusAnimationConfiguration)focusingConfiguration
{
  return self->_focusingConfiguration;
}

- (void)setFocusingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_focusingConfiguration, a3);
}

- (_UIFocusAnimationConfiguration)unfocusingConfiguration
{
  return self->_unfocusingConfiguration;
}

- (void)setUnfocusingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_unfocusingConfiguration, a3);
}

- (NSMutableArray)focusingAnimations
{
  return self->_focusingAnimations;
}

- (NSMutableArray)legacyFocusingAnimations
{
  return self->_legacyFocusingAnimations;
}

- (NSMutableArray)unfocusingAnimations
{
  return self->_unfocusingAnimations;
}

- (NSMutableArray)legacyUnfocusingAnimations
{
  return self->_legacyUnfocusingAnimations;
}

- (NSMutableArray)focusingCompletions
{
  return self->_focusingCompletions;
}

- (NSMutableArray)unfocusingCompletions
{
  return self->_unfocusingCompletions;
}

- (UIFocusUpdateContext)_focusUpdateContext
{
  return self->_focusUpdateContext;
}

- (BOOL)_isLocked
{
  return self->_locked;
}

- (int64_t)activeFocusAnimation
{
  return self->_activeFocusAnimation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusUpdateContext, 0);
  objc_storeStrong((id *)&self->_unfocusingCompletions, 0);
  objc_storeStrong((id *)&self->_focusingCompletions, 0);
  objc_storeStrong((id *)&self->_legacyUnfocusingAnimations, 0);
  objc_storeStrong((id *)&self->_unfocusingAnimations, 0);
  objc_storeStrong((id *)&self->_legacyFocusingAnimations, 0);
  objc_storeStrong((id *)&self->_focusingAnimations, 0);
  objc_storeStrong((id *)&self->_unfocusingConfiguration, 0);
  objc_storeStrong((id *)&self->_focusingConfiguration, 0);
}

@end
