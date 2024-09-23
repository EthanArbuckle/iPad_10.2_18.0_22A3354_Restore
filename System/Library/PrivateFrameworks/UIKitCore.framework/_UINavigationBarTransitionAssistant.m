@implementation _UINavigationBarTransitionAssistant

- (_UINavigationBarTransitionAssistant)initWithNavigationBar:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  _UINavigationBarTransitionAssistant *v8;
  _UINavigationBarTransitionAssistant *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UINavigationBarTransitionAssistant;
  v8 = -[_UINavigationBarTransitionAssistant init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_navigationBar, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
  }

  return v9;
}

+ (id)pushTransitionAssistantForNavigationBar:(id)a3 delegate:(id)a4 crossfade:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNavigationBar:delegate:", v9, v8);

  objc_msgSend(v10, "_getTransitionCoordinator");
  objc_msgSend(v10, "_getPushDurationAndTransitionAlwaysCrossfade:", v5);
  objc_msgSend(v10, "_getInteractive");
  return v10;
}

+ (id)popTransitionAssistantForNavigationBar:(id)a3 delegate:(id)a4 crossfade:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNavigationBar:delegate:", v9, v8);

  objc_msgSend(v10, "_getTransitionCoordinator");
  objc_msgSend(v10, "_getPopDurationAndTransitionAlwaysCrossfade:", v5);
  objc_msgSend(v10, "_getInteractive");
  return v10;
}

- (BOOL)shouldAnimateAlongside
{
  id WeakRetained;
  BOOL v3;

  if (!self->_interruptable)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
  v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)shouldCrossfade
{
  return self->_transition == 3;
}

- (void)startInteractiveTransition
{
  NSMutableArray *v3;
  NSMutableArray *animationIDs;
  id WeakRetained;
  double v6;
  id v7;

  if (self->_interactive && !self->_interruptable)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    animationIDs = self->_animationIDs;
    self->_animationIDs = v3;

    -[_UINavigationBarTransitionAssistant _startTrackingAnimations](self, "_startTrackingAnimations");
    if (!+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators](UIViewPropertyAnimator, "_canEnableTrackingAnimationsWithAnimators"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
      objc_msgSend(WeakRetained, "layer");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      LODWORD(v6) = 0;
      objc_msgSend(v7, "setSpeed:", v6);
      objc_msgSend(v7, "setTimeOffset:", 0.0);

    }
  }
}

- (void)updateInteractiveTransitionPercent:(double)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  void *v12;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->_interruptable)
  {
    if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators](UIViewPropertyAnimator, "_canEnableTrackingAnimationsWithAnimators"))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = self->_animationIDs;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v5);
            +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_animatorForTrackedAnimationsUUID:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "pauseAnimation");
            objc_msgSend(v10, "setFractionComplete:", a3);

          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }

    }
    else
    {
      v11 = self->_duration * a3;
      WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
      objc_msgSend(WeakRetained, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTimeOffset:", v11);

    }
  }
}

- (void)_clearAnimationsWithDuration:(double)a3 curve:(int64_t)a4 reverse:(BOOL)a5
{
  _BOOL8 v5;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  UICubicTimingParameters *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  NSMutableArray *animationIDs;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators](UIViewPropertyAnimator, "_canEnableTrackingAnimationsWithAnimators"))
  {
    v27 = 0uLL;
    v28 = 0uLL;
    v25 = 0uLL;
    v26 = 0uLL;
    v9 = self->_animationIDs;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:](UIViewPropertyAnimator, "_animatorForTrackedAnimationsUUID:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[UICubicTimingParameters initWithAnimationCurve:]([UICubicTimingParameters alloc], "initWithAnimationCurve:", a4);
          objc_msgSend(v14, "setReversed:", v5);
          objc_msgSend(v14, "continueAnimationWithTimingParameters:durationFactor:", v15, a3 / self->_duration);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v11);
    }
  }
  else
  {
    v23 = 0uLL;
    v24 = 0uLL;
    v21 = 0uLL;
    v22 = 0uLL;
    v9 = self->_animationIDs;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v9);
          +[UIView _completeAnimationWithUUID:duration:curve:reverse:](UIView, "_completeAnimationWithUUID:duration:curve:reverse:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), a4, v5, a3, (_QWORD)v21);
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v17);
    }
  }

  animationIDs = self->_animationIDs;
  self->_animationIDs = 0;

}

- (void)finishInteractiveTransitionPercent:(double)a3 completionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id WeakRetained;
  double duration;
  double v11;
  double v12;
  id v13;

  self->_cancelledTransition = 0;
  if (!self->_interruptable)
  {
    if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators](UIViewPropertyAnimator, "_canEnableTrackingAnimationsWithAnimators"))
    {
      -[_UINavigationBarTransitionAssistant _clearAnimationsWithDuration:curve:reverse:](self, "_clearAnimationsWithDuration:curve:reverse:", a5, 0, (1.0 - a3) * self->_duration / a4);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
      objc_msgSend(WeakRetained, "layer");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      duration = self->_duration;
      objc_msgSend(v13, "timeOffset");
      -[_UINavigationBarTransitionAssistant _clearAnimationsWithDuration:curve:reverse:](self, "_clearAnimationsWithDuration:curve:reverse:", a5, 0, duration - v11);
      *(float *)&v12 = a4;
      objc_msgSend(v13, "setSpeed:", v12);

    }
  }
}

- (void)cancelInteractiveTransitionPercent:(double)a3 completionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id WeakRetained;
  double v10;
  id v11;

  self->_cancelledTransition = 1;
  if (!self->_interruptable)
  {
    if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators](UIViewPropertyAnimator, "_canEnableTrackingAnimationsWithAnimators"))
    {
      -[_UINavigationBarTransitionAssistant _clearAnimationsWithDuration:curve:reverse:](self, "_clearAnimationsWithDuration:curve:reverse:", a5, 1, self->_duration * a3 / a4);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
      objc_msgSend(WeakRetained, "layer");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "timeOffset");
      -[_UINavigationBarTransitionAssistant _clearAnimationsWithDuration:curve:reverse:](self, "_clearAnimationsWithDuration:curve:reverse:", a5, 1);
      *(float *)&v10 = a4;
      objc_msgSend(v11, "setSpeed:", v10);

    }
  }
}

- (void)finishTrackingInteractiveTransition
{
  if (self->_interactive && !self->_interruptable)
    -[_UINavigationBarTransitionAssistant _finishTrackingAnimations](self, "_finishTrackingAnimations");
}

- (void)_startTrackingAnimations
{
  NSMutableArray *animationIDs;
  uint64_t v4;
  NSMutableArray *v5;
  id v6;

  if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators](UIViewPropertyAnimator, "_canEnableTrackingAnimationsWithAnimators"))
  {
    +[UIViewPropertyAnimator _startTrackingAnimations](UIViewPropertyAnimator, "_startTrackingAnimations");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:](UIViewPropertyAnimator, "_setTrackedAnimationsStartPaused:", 1);
    animationIDs = self->_animationIDs;
    v4 = (uint64_t)v6;
  }
  else
  {
    v5 = self->_animationIDs;
    +[UIView _startAnimationTracking](UIView, "_startAnimationTracking");
    v4 = objc_claimAutoreleasedReturnValue();
    animationIDs = v5;
    v6 = (id)v4;
  }
  -[NSMutableArray addObject:](animationIDs, "addObject:", v4);

}

- (void)_finishTrackingAnimations
{
  if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators](UIViewPropertyAnimator, "_canEnableTrackingAnimationsWithAnimators"))
  {
    +[UIViewPropertyAnimator _finishTrackingAnimations](UIViewPropertyAnimator, "_finishTrackingAnimations");
  }
  else
  {
    +[UIView _finishAnimationTracking](UIView, "_finishAnimationTracking");
  }
}

- (void)incrementAnimationCount
{
  if (self->_interactive && !self->_interruptable)
    ++self->_animationCount;
}

- (void)decrementAnimationCount
{
  int64_t animationCount;
  BOOL v4;
  BOOL v5;
  int64_t v6;
  id WeakRetained;
  double v8;
  id v9;

  if (!self->_interruptable)
  {
    animationCount = self->_animationCount;
    v4 = animationCount == 1;
    v5 = animationCount < 1;
    v6 = animationCount - 1;
    if (!v5)
    {
      self->_animationCount = v6;
      if (v4
        && !+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators](UIViewPropertyAnimator, "_canEnableTrackingAnimationsWithAnimators"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
        objc_msgSend(WeakRetained, "layer");
        v9 = (id)objc_claimAutoreleasedReturnValue();

        LODWORD(v8) = 1.0;
        objc_msgSend(v9, "setSpeed:", v8);
        objc_msgSend(v9, "setBeginTime:", 0.0);
        objc_msgSend(v9, "setTimeOffset:", 0.0);

      }
    }
  }
}

- (void)_getTransitionCoordinator
{
  char v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "_hasInterruptibleNavigationTransition");
  else
    v3 = 0;
  self->_interruptable = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "_transitionCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_transitionCoordinator, v4);

  }
}

- (int64_t)_transitionOverrideFrom:(id)a3 defaultingTo:(int64_t)a4
{
  uint64_t v5;
  int64_t v6;

  v5 = objc_msgSend(a3, "_navigationBarTransitionVariant");
  v6 = 4;
  if (v5 != 2)
    v6 = a4;
  if (v5 == 1)
    return 3;
  else
    return v6;
}

- (void)_getPushDurationAndTransitionAlwaysCrossfade:(BOOL)a3
{
  int64_t v5;
  double v6;
  double v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "_willPerformCustomNavigationTransitionForPush"))
  {
    if (a3)
      v5 = 3;
    else
      v5 = -[_UINavigationBarTransitionAssistant _transitionOverrideFrom:defaultingTo:](self, "_transitionOverrideFrom:defaultingTo:", WeakRetained, 1);
    self->_transition = v5;
    objc_msgSend(WeakRetained, "_customNavigationTransitionDuration");
    self->_duration = v6;
  }
  if (self->_duration == 0.0)
  {
    +[UINavigationBar defaultAnimationDuration](UINavigationBar, "defaultAnimationDuration");
    self->_duration = v7;
  }

}

- (void)_getPopDurationAndTransitionAlwaysCrossfade:(BOOL)a3
{
  int64_t v5;
  double v6;
  double v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "_willPerformCustomNavigationTransitionForPop"))
  {
    if (a3)
      v5 = 3;
    else
      v5 = -[_UINavigationBarTransitionAssistant _transitionOverrideFrom:defaultingTo:](self, "_transitionOverrideFrom:defaultingTo:", WeakRetained, 2);
    self->_transition = v5;
    objc_msgSend(WeakRetained, "_customNavigationTransitionDuration");
    self->_duration = v6;
  }
  if (self->_duration == 0.0)
  {
    +[UINavigationBar defaultAnimationDuration](UINavigationBar, "defaultAnimationDuration");
    self->_duration = v7;
  }

}

- (void)_getInteractive
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
  self->_interactive = objc_msgSend(WeakRetained, "isInteractive");

  self->_animationCount = 0;
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  return (UIViewControllerTransitionCoordinator *)objc_loadWeakRetained((id *)&self->_transitionCoordinator);
}

- (UINavigationBar)navigationBar
{
  return (UINavigationBar *)objc_loadWeakRetained((id *)&self->_navigationBar);
}

- (_UINavigationBarDelegatePrivate)delegate
{
  return (_UINavigationBarDelegatePrivate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)transition
{
  return self->_transition;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)interruptable
{
  return self->_interruptable;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (BOOL)needsLifetimeExtended
{
  return self->_needsLifetimeExtended;
}

- (void)setNeedsLifetimeExtended:(BOOL)a3
{
  self->_needsLifetimeExtended = a3;
}

- (BOOL)cancelledTransition
{
  return self->_cancelledTransition;
}

- (BOOL)shouldHideBackButtonDuringTransition
{
  return self->_shouldHideBackButtonDuringTransition;
}

- (void)setShouldHideBackButtonDuringTransition:(BOOL)a3
{
  self->_shouldHideBackButtonDuringTransition = a3;
}

- (BOOL)shouldUpdatePromptAfterTransition
{
  return self->_shouldUpdatePromptAfterTransition;
}

- (void)setShouldUpdatePromptAfterTransition:(BOOL)a3
{
  self->_shouldUpdatePromptAfterTransition = a3;
}

- (NSArray)animationIDs
{
  return &self->_animationIDs->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_navigationBar);
  objc_destroyWeak((id *)&self->_transitionCoordinator);
  objc_storeStrong((id *)&self->_animationIDs, 0);
}

@end
