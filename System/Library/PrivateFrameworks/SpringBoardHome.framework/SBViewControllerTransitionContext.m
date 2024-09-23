@implementation SBViewControllerTransitionContext

void __85__SBViewControllerTransitionContext__runAlongsideAnimationBlocksWithFactory_options___block_invoke(uint64_t a1)
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
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
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

- (SBViewControllerTransitionContext)init
{
  SBViewControllerTransitionContext *v2;
  SBViewControllerTransitionContext *v3;
  uint64_t v4;
  __int128 v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *viewControllersByKey;
  NSMutableDictionary *v8;
  NSMutableDictionary *viewsByKey;
  uint64_t v10;
  NSMapTable *initialFramesByViewController;
  uint64_t v12;
  NSMapTable *finalFramesByViewController;
  uint64_t v14;
  NSMutableArray *alongsideAnimations;
  uint64_t v16;
  NSMutableArray *alongsideCompletions;
  uint64_t v18;
  NSMutableArray *alongsideInteractionEndedHandlers;
  uint64_t v20;
  NSMutableSet *alongsideAnimationViews;
  uint64_t v22;
  NSMutableArray *transitionContinuations;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SBViewControllerTransitionContext;
  v2 = -[SBViewControllerTransitionContext init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_presentationStyle = -1;
    v4 = MEMORY[0x1E0C9BAA8];
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v2->_targetTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v2->_targetTransform.c = v5;
    *(_OWORD *)&v2->_targetTransform.tx = *(_OWORD *)(v4 + 32);
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    viewControllersByKey = v3->_viewControllersByKey;
    v3->_viewControllersByKey = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    viewsByKey = v3->_viewsByKey;
    v3->_viewsByKey = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 2);
    initialFramesByViewController = v3->_initialFramesByViewController;
    v3->_initialFramesByViewController = (NSMapTable *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 2);
    finalFramesByViewController = v3->_finalFramesByViewController;
    v3->_finalFramesByViewController = (NSMapTable *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    alongsideAnimations = v3->_alongsideAnimations;
    v3->_alongsideAnimations = (NSMutableArray *)v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    alongsideCompletions = v3->_alongsideCompletions;
    v3->_alongsideCompletions = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    alongsideInteractionEndedHandlers = v3->_alongsideInteractionEndedHandlers;
    v3->_alongsideInteractionEndedHandlers = (NSMutableArray *)v18;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    alongsideAnimationViews = v3->_alongsideAnimationViews;
    v3->_alongsideAnimationViews = (NSMutableSet *)v20;

    v3->_wantsAnimation = 1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    transitionContinuations = v3->_transitionContinuations;
    v3->_transitionContinuations = (NSMutableArray *)v22;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transitionContinuations, 0);
  objc_storeStrong((id *)&self->_alongsideAnimationViews, 0);
  objc_storeStrong((id *)&self->_alongsideInteractionEndedHandlers, 0);
  objc_storeStrong((id *)&self->_alongsideCompletions, 0);
  objc_storeStrong((id *)&self->_alongsideAnimations, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_transitionAnimationFactory, 0);
  objc_storeStrong((id *)&self->_finalFramesByViewController, 0);
  objc_storeStrong((id *)&self->_initialFramesByViewController, 0);
  objc_storeStrong((id *)&self->_viewsByKey, 0);
  objc_storeStrong((id *)&self->_viewControllersByKey, 0);
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  NSMutableArray *alongsideAnimations;
  void *v9;
  void *v10;
  NSMutableArray *alongsideCompletions;
  void *v12;
  void *v13;

  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    if (v6)
    {
      alongsideAnimations = self->_alongsideAnimations;
      v9 = (void *)objc_msgSend((id)v6, "copy");
      v10 = _Block_copy(v9);
      -[NSMutableArray addObject:](alongsideAnimations, "addObject:", v10);

    }
    if (v7)
    {
      alongsideCompletions = self->_alongsideCompletions;
      v12 = (void *)objc_msgSend((id)v7, "copy");
      v13 = _Block_copy(v12);
      -[NSMutableArray addObject:](alongsideCompletions, "addObject:", v13);

    }
  }

  return (v6 | v7) != 0;
}

- (void)completeTransition:(BOOL)a3
{
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBViewControllerTransitionContext delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_transitionDidBeginCalled && (objc_opt_respondsToSelector() & 1) != 0)
  {
    self->_transitionDidBeginCalled = 1;
    objc_msgSend(v4, "transitionDidBegin:", self);
  }
  self->_animationFinished = 1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_transitionContinuations;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[SBViewControllerTransitionContext _acquireTransitionCompletion](self, "_acquireTransitionCompletion", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, SBViewControllerTransitionContext *, void *))(v10 + 16))(v10, self, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[SBViewControllerTransitionContext _completeTransitionIfPossible](self, "_completeTransitionIfPossible");
}

- (void)startTransition
{
  SBViewControllerTransitionContext *v2;
  void *v3;
  SBViewControllerTransitionContext *v4;
  int v5;
  void *v6;
  UIViewControllerAnimatedTransitioning *animator;
  SBViewControllerTransitionContext *v8;

  v2 = self;
  v8 = v2;
  if (v2->_interactor)
  {
    -[SBViewControllerTransitionContext _interactorSupportsRestarting](v2, "_interactorSupportsRestarting");
    v2 = v8;
  }
  -[SBViewControllerTransitionContext delegate](v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transitionWillBegin:", v8);
  v8->_transitionStarted = 1;
  if (!v8->_interactor)
  {
    if (-[SBViewControllerTransitionContext isAnimated](v8, "isAnimated"))
    {
      -[SBViewControllerTransitionContext _updateTransitionAnimationFactoryAndOptions](v8, "_updateTransitionAnimationFactoryAndOptions");
      -[SBViewControllerTransitionContext transitionAnimationFactory](v8, "transitionAnimationFactory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBViewControllerTransitionContext _runAlongsideAnimationBlocksWithFactory:options:](v8, "_runAlongsideAnimationBlocksWithFactory:options:", v6, -[SBViewControllerTransitionContext transitionAnimationOptions](v8, "transitionAnimationOptions"));

    }
    else
    {
      animator = v8->_animator;
      -[SBViewControllerTransitionContext _runAlongsideAnimationBlocksInEnclosingAnimationContext](v8, "_runAlongsideAnimationBlocksInEnclosingAnimationContext");
      if (!animator)
      {
        v5 = 1;
        goto LABEL_12;
      }
    }
    -[UIViewControllerAnimatedTransitioning animateTransition:](v8->_animator, "animateTransition:");
    v5 = 0;
LABEL_12:
    v4 = v8;
    goto LABEL_13;
  }
  -[SBViewControllerTransitionContext _startInteractiveTransition](v8, "_startInteractiveTransition");
  v4 = v8;
  v5 = 0;
LABEL_13:
  if (!v4->_transitionDidBeginCalled && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v8->_transitionDidBeginCalled = 1;
    objc_msgSend(v3, "transitionDidBegin:");
  }
  if (v5)
    -[SBViewControllerTransitionContext completeTransition:](v8, "completeTransition:", 1);

}

- (SBViewControllerTransitionContextDelegate)delegate
{
  return (SBViewControllerTransitionContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)transitionAnimationFactory
{
  return self->_transitionAnimationFactory;
}

- (BOOL)isAnimated
{
  return self->_animator && self->_wantsAnimation;
}

- (unint64_t)transitionAnimationOptions
{
  return self->_transitionAnimationOptions;
}

- (void)_updateTransitionAnimationFactoryAndOptions
{
  BSUIAnimationFactory *v3;
  void *v4;
  BSUIAnimationFactory *transitionAnimationFactory;
  unint64_t v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewControllerAnimatedTransitioning transitionAnimationFactory:](self->_animator, "transitionAnimationFactory:", self);
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0D01908];
    -[SBViewControllerTransitionContext transitionDuration](self, "transitionDuration");
    objc_msgSend(v4, "factoryWithDuration:");
  }
  v3 = (BSUIAnimationFactory *)objc_claimAutoreleasedReturnValue();
  transitionAnimationFactory = self->_transitionAnimationFactory;
  self->_transitionAnimationFactory = v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = -[UIViewControllerAnimatedTransitioning transitionAnimationOptions:](self->_animator, "transitionAnimationOptions:", self);
  else
    v6 = 0;
  self->_transitionAnimationOptions = v6;
}

- (void)_runAlongsideAnimationBlocksWithFactory:(id)a3 options:(unint64_t)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__SBViewControllerTransitionContext__runAlongsideAnimationBlocksWithFactory_options___block_invoke;
  v4[3] = &unk_1E8D84C50;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:options:actions:", a3, a4, v4);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBViewControllerTransitionContext;
  -[SBViewControllerTransitionContext dealloc](&v2, sel_dealloc);
}

- (BOOL)isTransitioning
{
  return self->_transitionStarted && !self->_transitionFinished;
}

- (void)_completeTransition
{
  SBViewControllerTransitionContext *v2;
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BSUIAnimationFactory *transitionAnimationFactory;
  UIViewControllerAnimatedTransitioning *animator;
  UIViewControllerInteractiveTransitioning *interactor;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  -[SBViewControllerTransitionContext delegate](v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transitionWillFinish:", v2);
  v2->_transitionFinished = 1;
  if (v2->_animator && (objc_opt_respondsToSelector() & 1) != 0)
    -[UIViewControllerAnimatedTransitioning animationEnded:](v2->_animator, "animationEnded:", !v2->_transitionIsCancelled);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2->_alongsideCompletions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](v2->_alongsideAnimations, "removeAllObjects", (_QWORD)v12);
  -[NSMutableArray removeAllObjects](v2->_alongsideCompletions, "removeAllObjects");
  -[NSMutableArray removeAllObjects](v2->_alongsideInteractionEndedHandlers, "removeAllObjects");
  -[NSMutableSet removeAllObjects](v2->_alongsideAnimationViews, "removeAllObjects");
  -[NSMutableArray removeAllObjects](v2->_transitionContinuations, "removeAllObjects");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transitionDidFinish:", v2);
  -[NSMutableDictionary removeAllObjects](v2->_viewControllersByKey, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](v2->_viewsByKey, "removeAllObjects");
  -[NSMapTable removeAllObjects](v2->_initialFramesByViewController, "removeAllObjects");
  -[NSMapTable removeAllObjects](v2->_finalFramesByViewController, "removeAllObjects");
  transitionAnimationFactory = v2->_transitionAnimationFactory;
  v2->_transitionAnimationFactory = 0;

  animator = v2->_animator;
  v2->_animator = 0;

  interactor = v2->_interactor;
  v2->_interactor = 0;

  v2->_transitionPercentComplete = 1.0;
  v2->_transitionAnimationOptions = 0;

}

- (void)_completeTransitionIfPossible
{
  if (self->_animationFinished && !self->_outstandingClientCompletionCount)
    -[SBViewControllerTransitionContext _completeTransition](self, "_completeTransition");
}

- (CGRect)finalFrameForViewController:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[NSMapTable objectForKey:](self->_finalFramesByViewController, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)transitionWasRestarted
{
  return !-[SBViewControllerTransitionContext transitionWasCancelled](self, "transitionWasCancelled")
      && self->_transitionWasEverCancelled;
}

- (BOOL)transitionWasCancelled
{
  return self->_transitionIsCancelled;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animator, a3);
}

- (void)setViewController:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_viewControllersByKey, "setObject:forKey:", a3, a4);
}

- (void)setInitialFrame:(CGRect)a3 forViewController:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  NSMapTable *initialFramesByViewController;
  void *v9;
  id v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  initialFramesByViewController = self->_initialFramesByViewController;
  v9 = (void *)MEMORY[0x1E0CB3B18];
  v10 = a4;
  objc_msgSend(v9, "valueWithCGRect:", x, y, width, height);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](initialFramesByViewController, "setObject:forKey:", v11, v10);

}

- (void)setFinalFrame:(CGRect)a3 forViewController:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  NSMapTable *finalFramesByViewController;
  void *v9;
  id v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  finalFramesByViewController = self->_finalFramesByViewController;
  v9 = (void *)MEMORY[0x1E0CB3B18];
  v10 = a4;
  objc_msgSend(v9, "valueWithCGRect:", x, y, width, height);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](finalFramesByViewController, "setObject:forKey:", v11, v10);

}

- (void)setWantsAnimation:(BOOL)a3
{
  self->_wantsAnimation = a3;
}

- (void)setView:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_viewsByKey, "setObject:forKey:", a3, a4);
}

- (void)setInteractor:(id)a3
{
  objc_storeStrong((id *)&self->_interactor, a3);
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (void)_runAlongsideAnimationBlocksInEnclosingAnimationContext
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_alongsideAnimations;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)isInteractive
{
  return self->_interactor != 0;
}

- (UIViewControllerAnimatedTransitioning)animator
{
  return self->_animator;
}

- (UIViewControllerInteractiveTransitioning)interactor
{
  return self->_interactor;
}

- (void)updateInteractiveTransition:(double)a3
{
  id v5;

  -[SBViewControllerTransitionContext _interactiveAnimator](self, "_interactiveAnimator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_transitionPercentComplete = a3;
  -[SBViewControllerTransitionContext _runAlongsideAnimationBlocksInEnclosingAnimationContext](self, "_runAlongsideAnimationBlocksInEnclosingAnimationContext");
  objc_msgSend(v5, "updateTransition:withPercentComplete:", self, a3);

}

- (void)finishInteractiveTransition
{
  double v3;
  double v4;
  int64_t v5;
  UIViewControllerInteractiveTransitioning *interactor;
  void *v7;
  id v8;

  self->_transitionWasInteractive = 1;
  -[SBViewControllerTransitionContext _interactiveAnimator](self, "_interactiveAnimator");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBViewControllerTransitionContext completionVelocity](self, "completionVelocity");
  v4 = v3;
  v5 = -[SBViewControllerTransitionContext completionCurve](self, "completionCurve");
  interactor = self->_interactor;
  self->_interactor = 0;

  -[SBViewControllerTransitionContext _runInteractionEndedHandlers](self, "_runInteractionEndedHandlers");
  -[SBViewControllerTransitionContext _updateTransitionAnimationFactoryAndOptions](self, "_updateTransitionAnimationFactoryAndOptions");
  -[SBViewControllerTransitionContext transitionAnimationFactory](self, "transitionAnimationFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBViewControllerTransitionContext _runAlongsideAnimationBlocksWithFactory:options:](self, "_runAlongsideAnimationBlocksWithFactory:options:", v7, -[SBViewControllerTransitionContext transitionAnimationOptions](self, "transitionAnimationOptions"));

  objc_msgSend(v8, "finishInteractiveTransition:withCompletionSpeed:completionCurve:", self, v5, v4);
}

- (void)cancelInteractiveTransition
{
  id v3;

  -[SBViewControllerTransitionContext _interactiveAnimator](self, "_interactiveAnimator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBViewControllerTransitionContext cancelTransition](self, "cancelTransition");

}

- (id)viewControllerForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_viewControllersByKey, "objectForKey:", a3);
}

- (id)viewForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_viewsByKey, "objectForKey:", a3);
}

- (CGRect)initialFrameForViewController:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[NSMapTable objectForKey:](self->_initialFramesByViewController, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)cancelTransition
{
  void *v3;
  double v4;
  double v5;
  int64_t v6;
  UIViewControllerInteractiveTransitioning *interactor;
  void *v8;
  id v9;

  self->_transitionWasInteractive = -[SBViewControllerTransitionContext isInteractive](self, "isInteractive");
  -[SBViewControllerTransitionContext _reversibleAnimator](self, "_reversibleAnimator");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SBViewControllerTransitionContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transitionWillReverse:", self);
  -[SBViewControllerTransitionContext completionVelocity](self, "completionVelocity");
  v5 = v4;
  v6 = -[SBViewControllerTransitionContext completionCurve](self, "completionCurve");
  self->_animationFinished = 0;
  *(_WORD *)&self->_transitionIsCancelled = 257;
  interactor = self->_interactor;
  self->_interactor = 0;

  if (self->_transitionWasInteractive)
    -[SBViewControllerTransitionContext _runInteractionEndedHandlers](self, "_runInteractionEndedHandlers");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transitionDidReverse:", self);
  if (-[SBViewControllerTransitionContext isAnimated](self, "isAnimated"))
  {
    -[SBViewControllerTransitionContext _updateTransitionAnimationFactoryAndOptions](self, "_updateTransitionAnimationFactoryAndOptions");
    -[SBViewControllerTransitionContext transitionAnimationFactory](self, "transitionAnimationFactory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBViewControllerTransitionContext _runAlongsideAnimationBlocksWithFactory:options:](self, "_runAlongsideAnimationBlocksWithFactory:options:", v8, -[SBViewControllerTransitionContext transitionAnimationOptions](self, "transitionAnimationOptions"));

  }
  else
  {
    -[SBViewControllerTransitionContext _runAlongsideAnimationBlocksInEnclosingAnimationContext](self, "_runAlongsideAnimationBlocksInEnclosingAnimationContext");
  }
  objc_msgSend(v9, "cancelTransition:withCompletionSpeed:completionCurve:", self, v6, v5);

}

- (BOOL)supportsRestarting
{
  _BOOL4 v3;

  v3 = -[SBViewControllerTransitionContext _animatorSupportsRestarting](self, "_animatorSupportsRestarting");
  if (v3)
  {
    if (self->_interactor)
      LOBYTE(v3) = -[SBViewControllerTransitionContext _interactorSupportsRestarting](self, "_interactorSupportsRestarting");
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)restartTransition
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SBViewControllerTransitionContext _reversibleAnimator](self, "_reversibleAnimator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBViewControllerTransitionContext delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transitionWillReverse:", self);
  self->_animationFinished = 0;
  self->_transitionIsCancelled = 0;
  self->_transitionWasInteractive = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transitionDidReverse:", self);
  if (self->_interactor)
  {
    -[SBViewControllerTransitionContext _interactiveAnimator](self, "_interactiveAnimator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "percentComplete");
    self->_transitionBeganInteractively = 1;
    -[SBViewControllerTransitionContext updateInteractiveTransition:](self, "updateInteractiveTransition:");
    -[UIViewControllerInteractiveTransitioning startInteractiveTransition:](self->_interactor, "startInteractiveTransition:", self);

  }
  else
  {
    self->_transitionBeganInteractively = 0;
    if (-[SBViewControllerTransitionContext isAnimated](self, "isAnimated"))
    {
      -[SBViewControllerTransitionContext _updateTransitionAnimationFactoryAndOptions](self, "_updateTransitionAnimationFactoryAndOptions");
      -[SBViewControllerTransitionContext transitionAnimationFactory](self, "transitionAnimationFactory");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBViewControllerTransitionContext _runAlongsideAnimationBlocksWithFactory:options:](self, "_runAlongsideAnimationBlocksWithFactory:options:", v5, -[SBViewControllerTransitionContext transitionAnimationOptions](self, "transitionAnimationOptions"));

    }
    else
    {
      -[SBViewControllerTransitionContext _runAlongsideAnimationBlocksInEnclosingAnimationContext](self, "_runAlongsideAnimationBlocksInEnclosingAnimationContext");
    }
    objc_msgSend(v6, "animateTransition:", self);
  }

}

- (BOOL)initiallyInteractive
{
  return self->_transitionBeganInteractively;
}

- (BOOL)wasPreviousPhaseInteractive
{
  return self->_transitionWasInteractive;
}

- (double)transitionDuration
{
  double result;

  -[UIViewControllerAnimatedTransitioning transitionDuration:](self->_animator, "transitionDuration:", self);
  return result;
}

- (double)percentComplete
{
  return self->_transitionPercentComplete;
}

- (double)completionVelocity
{
  double result;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 1.0;
  -[UIViewControllerInteractiveTransitioning completionSpeed](self->_interactor, "completionSpeed");
  return result;
}

- (int64_t)completionCurve
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIViewControllerInteractiveTransitioning completionCurve](self->_interactor, "completionCurve");
  else
    return 0;
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8;
  _BOOL4 v9;
  id v10;

  v8 = a3;
  v9 = -[SBViewControllerTransitionContext animateAlongsideTransition:completion:](self, "animateAlongsideTransition:completion:", a4, a5);
  if (v9)
  {
    -[SBViewControllerTransitionContext containerView](self, "containerView");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 != v8)
      -[NSMutableSet addObject:](self->_alongsideAnimationViews, "addObject:", v8);
  }

  return v9;
}

- (void)notifyWhenInteractionEndsUsingBlock:(id)a3
{
  NSMutableArray *alongsideInteractionEndedHandlers;
  void *v4;
  id v5;

  alongsideInteractionEndedHandlers = self->_alongsideInteractionEndedHandlers;
  v5 = (id)objc_msgSend(a3, "copy");
  v4 = _Block_copy(v5);
  -[NSMutableArray addObject:](alongsideInteractionEndedHandlers, "addObject:", v4);

}

- (BOOL)requiresCancellableAnimations
{
  return -[SBViewControllerTransitionContext initiallyInteractive](self, "initiallyInteractive")
      || -[SBViewControllerTransitionContext _animatorIsReversible](self, "_animatorIsReversible");
}

- (void)addTransitionContinuation:(id)a3
{
  NSMutableArray *transitionContinuations;
  void *v4;
  id v5;

  transitionContinuations = self->_transitionContinuations;
  v5 = (id)objc_msgSend(a3, "copy");
  v4 = _Block_copy(v5);
  -[NSMutableArray addObject:](transitionContinuations, "addObject:", v4);

}

- (id)_acquireTransitionCompletion
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD aBlock[5];

  v2 = MEMORY[0x1E0C809B0];
  ++self->_outstandingClientCompletionCount;
  aBlock[0] = v2;
  aBlock[1] = 3221225472;
  aBlock[2] = __65__SBViewControllerTransitionContext__acquireTransitionCompletion__block_invoke;
  aBlock[3] = &unk_1E8D84C50;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  v4 = _Block_copy(v3);

  return v4;
}

uint64_t __65__SBViewControllerTransitionContext__acquireTransitionCompletion__block_invoke(uint64_t a1)
{
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
  return objc_msgSend(*(id *)(a1 + 32), "_completeTransitionIfPossible");
}

- (BOOL)_animatorIsReversible
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)_reversibleAnimator
{
  UIViewControllerAnimatedTransitioning *v3;

  if (-[SBViewControllerTransitionContext _animatorIsReversible](self, "_animatorIsReversible"))
    v3 = self->_animator;
  else
    v3 = 0;
  return v3;
}

- (BOOL)_animatorSupportsRestarting
{
  _BOOL4 v3;

  v3 = -[SBViewControllerTransitionContext _animatorIsReversible](self, "_animatorIsReversible");
  if (v3)
    LOBYTE(v3) = -[SBViewControllerTransitionContext _objectSupportsRestarting:](self, "_objectSupportsRestarting:", self->_animator);
  return v3;
}

- (BOOL)_interactorSupportsRestarting
{
  return -[SBViewControllerTransitionContext _objectSupportsRestarting:](self, "_objectSupportsRestarting:", self->_interactor);
}

- (BOOL)_objectSupportsRestarting:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "supportsRestarting");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_animatorIsInteractive
{
  int v2;

  v2 = -[SBViewControllerTransitionContext _animatorIsReversible](self, "_animatorIsReversible");
  if (v2)
    LOBYTE(v2) = objc_opt_respondsToSelector();
  return v2 & 1;
}

- (id)_interactiveAnimator
{
  UIViewControllerAnimatedTransitioning *v3;

  if (-[SBViewControllerTransitionContext _animatorIsInteractive](self, "_animatorIsInteractive"))
    v3 = self->_animator;
  else
    v3 = 0;
  return v3;
}

- (void)_startInteractiveTransition
{
  self->_transitionBeganInteractively = 1;
  -[UIViewControllerInteractiveTransitioning startInteractiveTransition:](self->_interactor, "startInteractiveTransition:", self);
}

- (void)_runInteractionEndedHandlers
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_alongsideInteractionEndedHandlers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (NSString)description
{
  return (NSString *)-[SBViewControllerTransitionContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBViewControllerTransitionContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext isInteractive](self, "isInteractive"), CFSTR("isInteractive"));
  v7 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext isInterruptible](self, "isInterruptible"), CFSTR("isInterruptible"));
  v8 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext isAnimated](self, "isAnimated"), CFSTR("isAnimated"));
  v9 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext supportsRestarting](self, "supportsRestarting"), CFSTR("supportsRestarting"));
  v10 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext wantsAnimation](self, "wantsAnimation"), CFSTR("wantsAnimation"));
  v11 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext isCancelled](self, "isCancelled"), CFSTR("isCancelled"));
  v12 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBViewControllerTransitionContext isTransitioning](self, "isTransitioning"), CFSTR("isTransitioning"));
  -[SBViewControllerTransitionContext percentComplete](self, "percentComplete");
  v13 = (id)objc_msgSend(v5, "appendFloat:withName:", CFSTR("percentComplete"));
  -[SBViewControllerTransitionContext containerView](self, "containerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v5, "appendPointer:withName:", v14, CFSTR("containerView"));

  -[SBViewControllerTransitionContext delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v5, "appendPointer:withName:", v16, CFSTR("delegate"));

  -[SBViewControllerTransitionContext viewControllerForKey:](self, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {

LABEL_4:
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __75__SBViewControllerTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
    v21[3] = &unk_1E8D84F18;
    v21[4] = self;
    v22 = v5;
    v23 = v4;
    objc_msgSend(v22, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("ViewControllers"), v23, v21);

    goto LABEL_5;
  }
  -[SBViewControllerTransitionContext viewControllerForKey:](self, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    goto LABEL_4;
LABEL_5:

  return v5;
}

void __75__SBViewControllerTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v2 = *MEMORY[0x1E0DC55B8];
  objc_msgSend(*(id *)(a1 + 32), "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __75__SBViewControllerTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke_2;
    v13[3] = &unk_1E8D84EF0;
    v5 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v5;
    objc_msgSend(v14, "appendBodySectionWithName:multilinePrefix:block:", v2, v6, v13);

  }
  v7 = *MEMORY[0x1E0DC55C8];
  objc_msgSend(*(id *)(a1 + 32), "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __75__SBViewControllerTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v11[3] = &unk_1E8D84EF0;
    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v9;
    objc_msgSend(v12, "appendBodySectionWithName:multilinePrefix:block:", v7, v10, v11);

  }
}

void __75__SBViewControllerTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v2 = *MEMORY[0x1E0DC55B8];
  objc_msgSend(*(id *)(a1 + 32), "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "appendPointer:withName:", v8, v2);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "initialFrameForViewController:", v8);
  v5 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("initialFrameForViewController"));
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "finalFrameForViewController:", v8);
  v7 = (id)objc_msgSend(v6, "appendRect:withName:", CFSTR("finalFrameForViewController"));

}

void __75__SBViewControllerTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v2 = *MEMORY[0x1E0DC55C8];
  objc_msgSend(*(id *)(a1 + 32), "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "appendPointer:withName:", v8, v2);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "initialFrameForViewController:", v8);
  v5 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("initialFrameForViewController"));
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "finalFrameForViewController:", v8);
  v7 = (id)objc_msgSend(v6, "appendRect:withName:", CFSTR("finalFrameForViewController"));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBViewControllerTransitionContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (CGAffineTransform)targetTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].a;
  return self;
}

- (void)setTargetTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_targetTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_targetTransform.tx = v4;
  *(_OWORD *)&self->_targetTransform.a = v3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (BOOL)wantsAnimation
{
  return self->_wantsAnimation;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

@end
