@implementation _UIViewControllerTransitionContext

- (void)_setState:(int64_t)a3
{
  self->__state = a3;
}

- (id)_postInteractiveCompletionHandler
{
  return self->__postInteractiveCompletionHandler;
}

- (void)_setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (void)_setContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_containerView, a3);
}

- (_UIViewControllerTransitionContext)init
{
  objc_super v3;

  self->_previousPercentComplete = 0.0;
  self->__completionVelocity = 1.0;
  self->__completionCurve = 0;
  self->_presentationStyle = -1;
  *(_BYTE *)&self->_transitionContextFlags |= 0x10u;
  self->__allowUserInteraction = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIViewControllerTransitionContext;
  return -[_UIViewControllerTransitionContext init](&v3, sel_init);
}

- (void)_setIsAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (void)_setDuration:(double)a3
{
  self->__duration = a3;
}

- (void)_setInteractor:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  id v11;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__interactor);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->__interactor);

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)&self->__interactor);
      objc_getAssociatedObject(v7, &_UIInteractionControllerAssociatedTransitionContextsKey);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "removeObject:", self);
    }
    objc_storeWeak((id *)&self->__interactor, obj);
    v5 = obj;
    if (obj)
    {
      *(_BYTE *)&self->_transitionContextFlags = *(_BYTE *)&self->_transitionContextFlags & 0xFE | objc_opt_respondsToSelector() & 1;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = 2;
      else
        v9 = 0;
      *(_BYTE *)&self->_transitionContextFlags = *(_BYTE *)&self->_transitionContextFlags & 0xFD | v9;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = objc_msgSend(obj, "wantsInteractiveStart");
      else
        v10 = 1;
      -[_UIViewControllerTransitionContext _setInitiallyInteractive:](self, "_setInitiallyInteractive:", v10);
      -[_UIViewControllerTransitionContext _setCurrentlyInteractive:](self, "_setCurrentlyInteractive:", v10);
      objc_getAssociatedObject(obj, &_UIInteractionControllerAssociatedTransitionContextsKey);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_setAssociatedObject(obj, &_UIInteractionControllerAssociatedTransitionContextsKey, v11, (void *)1);
      }
      objc_msgSend(v11, "addObject:", self);

      v5 = obj;
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_UIViewControllerTransitionContext _enableInteractionForDisabledViews](self, "_enableInteractionForDisabledViews");
  -[_UIViewControllerTransitionContext _runInvalidationHandlers](self, "_runInvalidationHandlers");
  v3.receiver = self;
  v3.super_class = (Class)_UIViewControllerTransitionContext;
  -[_UIViewControllerTransitionContext dealloc](&v3, sel_dealloc);
}

- (void)_enableInteractionForDisabledViews
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *disabledViews;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_disabledViews;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setUserInteractionEnabled:", 1, (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  disabledViews = self->_disabledViews;
  self->_disabledViews = 0;

}

- (void)completeTransition:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _UIViewControllerTransitionContext *v6;
  id willCompleteHandler;
  void (**v8)(void *, _UIViewControllerTransitionContext *, _BOOL8);
  void (**completionHandler)(id, _UIViewControllerTransitionContext *, _BOOL8);
  void (**didCompleteHandler)(id, _UIViewControllerTransitionContext *, _BOOL8);
  id v11;
  _UIViewControllerTransitionContext *v12;

  if ((*(_BYTE *)&self->_transitionContextFlags & 0x20) == 0)
  {
    v3 = a3;
    *(_BYTE *)&self->_transitionContextFlags |= 0x20u;
    _UIQOSExcludeCommitFromGlitchTrackingIfUnmanaged();
    v12 = self;
    -[_UIViewControllerTransitionContext _animator](v12, "_animator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewControllerTransitionContext _runInvalidationHandlers](v12, "_runInvalidationHandlers");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "_animationWillEnd:didComplete:", v12, v3);
    v6 = v12;
    willCompleteHandler = v12->__willCompleteHandler;
    if (willCompleteHandler)
    {
      v8 = (void (**)(void *, _UIViewControllerTransitionContext *, _BOOL8))_Block_copy(willCompleteHandler);
      v8[2](v8, v12, v3);

      v6 = v12;
    }
    completionHandler = (void (**)(id, _UIViewControllerTransitionContext *, _BOOL8))v6->__completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, v12, v3);
      v6 = v12;
    }
    -[_UIViewControllerTransitionContext _runAlongsideCompletions](v6, "_runAlongsideCompletions");
    didCompleteHandler = (void (**)(id, _UIViewControllerTransitionContext *, _BOOL8))v12->__didCompleteHandler;
    if (didCompleteHandler)
      didCompleteHandler[2](didCompleteHandler, v12, v3);
    if (v5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "animationEnded:", v3);
    }
    v11 = (id)objc_opt_self();

  }
}

- (void)_setAnimator:(id)a3
{
  id v4;
  _UIViewControllerTransitionContext *v5;
  id obj;

  obj = a3;
  -[_UIViewControllerTransitionContext _animator](self, "_animator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->__animator, obj);
    if (v4)
    {
      +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:", v4);
      v5 = (_UIViewControllerTransitionContext *)objc_claimAutoreleasedReturnValue();
      if (v5 == self)
        objc_setAssociatedObject(v4, &_UIAnimationControllerAssociatedTransitionContextKey, 0, (void *)1);

    }
    if (obj)
      objc_setAssociatedObject(obj, &_UIAnimationControllerAssociatedTransitionContextKey, self, (void *)1);
  }

}

- (UIViewControllerAnimatedTransitioning)_animator
{
  return (UIViewControllerAnimatedTransitioning *)objc_loadWeakRetained((id *)&self->__animator);
}

- (void)_runAlongsideCompletions
{
  _UIViewControllerTransitionCoordinator *auxContext;
  void *v4;
  _QWORD v5[5];

  auxContext = self->__auxContext;
  if (auxContext)
  {
    -[_UIViewControllerTransitionCoordinator _alongsideCompletions](self->__auxContext, "_alongsideCompletions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62___UIViewControllerTransitionContext__runAlongsideCompletions__block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    -[_UIViewControllerTransitionCoordinator _applyBlocks:releaseBlocks:](auxContext, "_applyBlocks:releaseBlocks:", v4, v5);

    -[_UIViewControllerTransitionCoordinator _setInteractiveChangeHandlers:](self->__auxContext, "_setInteractiveChangeHandlers:", 0);
  }
}

- (void)__runAlongsideAnimations
{
  _UIViewControllerTransitionCoordinator *auxContext;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  _UIViewControllerTransitionCoordinator *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  _UIQOSExcludeCommitFromGlitchTrackingIfUnmanaged();
  auxContext = self->__auxContext;
  if (auxContext)
  {
    -[_UIViewControllerTransitionCoordinator _systemAlongsideAnimations](self->__auxContext, "_systemAlongsideAnimations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62___UIViewControllerTransitionContext___runAlongsideAnimations__block_invoke;
    v12[3] = &unk_1E16B1B28;
    v12[4] = self;
    -[_UIViewControllerTransitionCoordinator _applyBlocks:releaseBlocks:](auxContext, "_applyBlocks:releaseBlocks:", v4, v12);

    v6 = 0;
    v7 = 0;
    do
    {
      v8 = v7;
      v9 = v6;
      -[_UIViewControllerTransitionCoordinator _alongsideAnimations](self->__auxContext, "_alongsideAnimations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        break;
      v10 = self->__auxContext;
      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __62___UIViewControllerTransitionContext___runAlongsideAnimations__block_invoke_2;
      v11[3] = &unk_1E16B1B28;
      v11[4] = self;
      -[_UIViewControllerTransitionCoordinator _applyBlocks:releaseBlocks:](v10, "_applyBlocks:releaseBlocks:", v7, v11);
      v6 = 1;
    }
    while ((v9 & 1) == 0);
    -[_UIViewControllerTransitionCoordinator _setAlongsideAnimations:](self->__auxContext, "_setAlongsideAnimations:", 0);

  }
  *(_BYTE *)&self->_transitionContextFlags |= 4u;
}

- (void)_setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (id)_transitionCoordinator
{
  _UIViewControllerTransitionCoordinator *auxContext;
  _UIViewControllerTransitionCoordinator *v3;

  auxContext = self->__auxContext;
  if (auxContext)
    v3 = auxContext;
  else
    v3 = -[_UIViewControllerTransitionCoordinator initWithMainContext:]([_UIViewControllerTransitionCoordinator alloc], "initWithMainContext:", self);
  return v3;
}

- (void)_setAuxContext:(id)a3
{
  objc_storeStrong((id *)&self->__auxContext, a3);
}

- (_UIViewControllerTransitionCoordinator)_auxContext
{
  return self->__auxContext;
}

- (void)_setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)_setDidCompleteHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)_transitionIsInFlight
{
  return -[_UIViewControllerTransitionContext _state](self, "_state") == 1;
}

- (void)_setTransitionIsInFlight:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[_UIViewControllerTransitionContext _state](self, "_state") != 4)
    -[_UIViewControllerTransitionContext _setState:](self, "_setState:", v3);
}

- (int64_t)_state
{
  return self->__state;
}

- (void)_setCompletionCurve:(int64_t)a3
{
  self->__completionCurve = a3;
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (BOOL)transitionWasCancelled
{
  return (*(_BYTE *)&self->_transitionContextFlags >> 3) & 1;
}

+ (id)_associatedTransitionContextForAnimationController:(id)a3
{
  return objc_getAssociatedObject(a3, &_UIAnimationControllerAssociatedTransitionContextKey);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__postInteractiveCompletionHandler, 0);
  objc_storeStrong(&self->__interactiveUpdateHandler, 0);
  objc_storeStrong((id *)&self->__auxContext, 0);
  objc_storeStrong(&self->__didCompleteHandler, 0);
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong(&self->__willCompleteHandler, 0);
  objc_destroyWeak((id *)&self->__interactor);
  objc_storeStrong((id *)&self->__containerViews, 0);
  objc_storeStrong((id *)&self->_disabledViews, 0);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->__animator);
}

- (double)_duration
{
  return self->__duration;
}

- (CGAffineTransform)_affineTransform
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  __int128 v13;
  CGAffineTransform *result;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  float64x2_t v19;
  CGAffineTransform v20;
  CGAffineTransform v21;

  -[_UIViewControllerTransitionContext _animator](self, "_animator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v4, "window"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "_fromWindowOrientation");
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(v6, "_toWindowOrientation");
      v10 = 0.0;
      v11 = 0.0;
      if (v9 != 1)
      {
        if (v9 == 3)
        {
          v11 = 1.57079633;
        }
        else if (v9 == 4)
        {
          v11 = -1.57079633;
        }
        else
        {
          v11 = 3.14159265;
          if (v9 != 2)
            v11 = 0.0;
        }
      }
      if (v8 != 1)
      {
        if (v8 == 3)
        {
          v10 = 1.57079633;
        }
        else if (v8 == 4)
        {
          v10 = -1.57079633;
        }
        else
        {
          v10 = 3.14159265;
          if (v8 != 2)
            v10 = 0.0;
        }
      }
      v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v20.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v20.c = v18;
      *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      CGAffineTransformRotate(&v21, &v20, v11 - v10);
      v19 = vrndaq_f64(*(float64x2_t *)&v21.c);
      *(float64x2_t *)&v21.a = vrndaq_f64(*(float64x2_t *)&v21.a);
      *(float64x2_t *)&v21.c = v19;
      *(float64x2_t *)&v21.tx = vrndaq_f64(*(float64x2_t *)&v21.tx);
      *(_OWORD *)&retstr->a = *(_OWORD *)&v21.a;
      *(float64x2_t *)&retstr->c = v19;
      v17 = *(_OWORD *)&v21.tx;
    }
    else
    {
      v15 = MEMORY[0x1E0C9BAA8];
      v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&retstr->c = v16;
      v17 = *(_OWORD *)(v15 + 32);
    }
    *(_OWORD *)&retstr->tx = v17;

  }
  else
  {
    v12 = MEMORY[0x1E0C9BAA8];
    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v13;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v12 + 32);
  }

  return result;
}

- (BOOL)isInterruptible
{
  return (*(_BYTE *)&self->_transitionContextFlags >> 6) & 1;
}

- (BOOL)isCurrentlyInteractive
{
  return self->_currentlyInteractive;
}

- (void)_setWillCompleteHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)_willCompleteHandler
{
  return self->__willCompleteHandler;
}

- (int64_t)_alongsideAnimationsCount
{
  int64_t result;
  void *v3;
  int64_t v4;

  result = (int64_t)self->__auxContext;
  if (result)
  {
    objc_msgSend((id)result, "_alongsideAnimations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    return v4;
  }
  return result;
}

+ (id)_associatedTransitionContextsForInteractionController:(id)a3
{
  return objc_getAssociatedObject(a3, &_UIInteractionControllerAssociatedTransitionContextsKey);
}

- (double)_previousPercentComplete
{
  return self->_previousPercentComplete;
}

- (void)_setPreviousPercentComplete:(double)a3
{
  self->_previousPercentComplete = a3;
}

- (void)_updateInteractiveTransitionWithoutTrackingPercentComplete:(double)a3
{
  void *v5;

  if (-[_UIViewControllerTransitionContext _initiallyInteractive](self, "_initiallyInteractive"))
  {
    -[_UIViewControllerTransitionContext _interactiveUpdateHandler](self, "_interactiveUpdateHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      *(_BYTE *)&self->_transitionContextFlags &= ~0x10u;
      (*((void (**)(double))self->__interactiveUpdateHandler + 2))(a3);
    }
  }
}

- (void)pauseInteractiveTransition
{
  id interactiveUpdateHandler;

  if (-[_UIViewControllerTransitionContext isInterruptible](self, "isInterruptible")
    && -[_UIViewControllerTransitionContext _state](self, "_state") == 1
    && !-[_UIViewControllerTransitionContext isCurrentlyInteractive](self, "isCurrentlyInteractive"))
  {
    interactiveUpdateHandler = self->__interactiveUpdateHandler;
    if (interactiveUpdateHandler)
    {
      *(_BYTE *)&self->_transitionContextFlags &= ~0x10u;
      (*((void (**)(id, _QWORD, _QWORD, _UIViewControllerTransitionContext *, double))interactiveUpdateHandler
       + 2))(interactiveUpdateHandler, 0, 0, self, self->_previousPercentComplete);
    }
    -[_UIViewControllerTransitionContext _interactivityDidChange:](self, "_interactivityDidChange:", 1);
  }
}

- (void)updateInteractiveTransition:(double)a3
{
  double v4;
  void *v5;
  double previousPercentComplete;
  id interactiveUpdateHandler;
  double v8;

  if (a3 < 0.0)
    a3 = 0.0;
  if (a3 <= 1.0)
    v4 = a3;
  else
    v4 = 1.0;
  if (-[_UIViewControllerTransitionContext _state](self, "_state") == 1)
  {
    if (-[_UIViewControllerTransitionContext isCurrentlyInteractive](self, "isCurrentlyInteractive"))
    {
      -[_UIViewControllerTransitionContext _interactiveUpdateHandler](self, "_interactiveUpdateHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        previousPercentComplete = self->_previousPercentComplete;

        if (previousPercentComplete != v4)
        {
          *(_BYTE *)&self->_transitionContextFlags &= ~0x10u;
          self->_previousPercentComplete = v4;
          interactiveUpdateHandler = self->__interactiveUpdateHandler;
          -[_UIViewControllerTransitionContext _percentOffset](self, "_percentOffset");
          (*((void (**)(id, _QWORD, _QWORD, _UIViewControllerTransitionContext *, double))interactiveUpdateHandler
           + 2))(interactiveUpdateHandler, 0, 0, self, v4 + v8);
        }
      }
    }
  }
}

- (void)finishInteractiveTransition
{
  char transitionContextFlags;
  id WeakRetained;
  double v5;
  id v6;
  _BOOL4 v7;
  void *v8;
  _UIViewControllerTransitionContext *v9;
  uint64_t v10;

  if (-[_UIViewControllerTransitionContext _state](self, "_state") != 1
    && -[_UIViewControllerTransitionContext _state](self, "_state") != 4)
  {
    v9 = self;
    v10 = 3;
    goto LABEL_16;
  }
  transitionContextFlags = (char)self->_transitionContextFlags;
  *(_BYTE *)&self->_transitionContextFlags = transitionContextFlags & 0xE7 | 0x10;
  if ((transitionContextFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->__interactor);
    objc_msgSend(WeakRetained, "completionSpeed");
    self->__completionVelocity = v5;

    if (self->__completionVelocity <= 0.0)
      self->__completionVelocity = 1.0;
  }
  if ((*(_BYTE *)&self->_transitionContextFlags & 2) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->__interactor);
    self->__completionCurve = objc_msgSend(v6, "completionCurve");

  }
  v7 = -[_UIViewControllerTransitionContext isCurrentlyInteractive](self, "isCurrentlyInteractive");
  if (!v7 && -[_UIViewControllerTransitionContext _state](self, "_state") != 4)
    goto LABEL_14;
  -[_UIViewControllerTransitionContext _interactiveUpdateHandler](self, "_interactiveUpdateHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    (*((void (**)(double))self->__interactiveUpdateHandler + 2))(self->_previousPercentComplete);
  if (!v7 || -[_UIViewControllerTransitionContext _state](self, "_state") == 4)
  {
LABEL_14:
    v9 = self;
    v10 = 0;
LABEL_16:
    -[_UIViewControllerTransitionContext _setState:](v9, "_setState:", v10);
    return;
  }
  -[_UIViewControllerTransitionContext _interactivityDidChange:](self, "_interactivityDidChange:", 0);
}

- (void)cancelInteractiveTransition
{
  char transitionContextFlags;
  char v4;
  id WeakRetained;
  double v6;
  double completionVelocity;
  double v8;
  BOOL v9;
  double v10;
  id v11;
  void *v12;
  _UIViewControllerTransitionContext *v13;
  uint64_t v14;

  if (-[_UIViewControllerTransitionContext _state](self, "_state") == 1
    || -[_UIViewControllerTransitionContext _state](self, "_state") == 4)
  {
    transitionContextFlags = (char)self->_transitionContextFlags;
    v4 = transitionContextFlags | 0x18;
    *(_BYTE *)&self->_transitionContextFlags = transitionContextFlags | 0x18;
    if ((transitionContextFlags & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->__interactor);
      objc_msgSend(WeakRetained, "completionSpeed");
      self->__completionVelocity = v6;

      completionVelocity = self->__completionVelocity;
      v8 = -completionVelocity;
      v9 = completionVelocity > 0.0;
      v10 = -1.0;
      if (v9)
        v10 = v8;
      self->__completionVelocity = v10;
      v4 = (char)self->_transitionContextFlags;
    }
    if ((v4 & 2) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->__interactor);
      self->__completionCurve = objc_msgSend(v11, "completionCurve");

    }
    if (-[_UIViewControllerTransitionContext isCurrentlyInteractive](self, "isCurrentlyInteractive")
      || -[_UIViewControllerTransitionContext _state](self, "_state") == 4)
    {
      -[_UIViewControllerTransitionContext _interactiveUpdateHandler](self, "_interactiveUpdateHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        (*((void (**)(double))self->__interactiveUpdateHandler + 2))(self->_previousPercentComplete);
    }
    if (-[_UIViewControllerTransitionContext _state](self, "_state") != 4)
    {
      -[_UIViewControllerTransitionContext _interactivityDidChange:](self, "_interactivityDidChange:", 0);
      return;
    }
    v13 = self;
    v14 = 0;
  }
  else
  {
    v13 = self;
    v14 = 2;
  }
  -[_UIViewControllerTransitionContext _setState:](v13, "_setState:", v14);
}

- (void)_stopInteractiveTransition
{
  -[_UIViewControllerTransitionContext _interactivityDidChange:](self, "_interactivityDidChange:", 0);
}

- (id)viewControllerForKey:(id)a3
{
  return 0;
}

- (id)viewForKey:(id)a3
{
  return 0;
}

- (CGRect)initialFrameForViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)finalFrameForViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setTransitionWasCancelled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_transitionContextFlags = *(_BYTE *)&self->_transitionContextFlags & 0xF7 | v3;
}

- (BOOL)_transitionIsCompleting
{
  return (*(_BYTE *)&self->_transitionContextFlags >> 4) & 1;
}

- (void)_setTransitionIsCompleting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_transitionContextFlags = *(_BYTE *)&self->_transitionContextFlags & 0xEF | v3;
}

- (void)_setInterruptible:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_transitionContextFlags = *(_BYTE *)&self->_transitionContextFlags & 0xBF | v3;
}

- (void)_setPerformingLayoutToLayoutTransition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_transitionContextFlags = v3 & 0x80 | *(_BYTE *)&self->_transitionContextFlags & 0x7F;
}

- (BOOL)_isPerformingLayoutToLayoutTransition
{
  return *(_BYTE *)&self->_transitionContextFlags >> 7;
}

- (void)_interactivityDidChange:(BOOL)a3
{
  _UIViewControllerTransitionCoordinator *auxContext;
  void *v5;
  _UIViewControllerTransitionCoordinator *v6;
  _QWORD v7[5];

  -[_UIViewControllerTransitionContext _setCurrentlyInteractive:](self, "_setCurrentlyInteractive:", a3);
  auxContext = self->__auxContext;
  if (auxContext)
  {
    -[_UIViewControllerTransitionCoordinator _interactiveChangeHandlers](auxContext, "_interactiveChangeHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = self->__auxContext;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __62___UIViewControllerTransitionContext__interactivityDidChange___block_invoke;
      v7[3] = &unk_1E16B1B28;
      v7[4] = self;
      -[_UIViewControllerTransitionCoordinator _applyBlocks:releaseBlocks:](v6, "_applyBlocks:releaseBlocks:", v5, v7);
    }

  }
}

- (BOOL)_ranAlongsideAnimations
{
  return (*(_BYTE *)&self->_transitionContextFlags >> 2) & 1;
}

- (BOOL)_transitionHasCompleted
{
  return (*(_BYTE *)&self->_transitionContextFlags >> 5) & 1;
}

- (void)_disableInteractionForViews:(id)a3
{
  id v5;
  NSArray *v6;
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
  -[_UIViewControllerTransitionContext _enableInteractionForDisabledViews](self, "_enableInteractionForDisabledViews");
  objc_storeStrong((id *)&self->_disabledViews, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_disabledViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setUserInteractionEnabled:", 0, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_runInvalidationHandlers
{
  _UIViewControllerTransitionCoordinator *auxContext;
  void *v4;
  _QWORD v5[5];

  auxContext = self->__auxContext;
  if (auxContext)
  {
    -[_UIViewControllerTransitionCoordinator _invalidationHandlers](self->__auxContext, "_invalidationHandlers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62___UIViewControllerTransitionContext__runInvalidationHandlers__block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    -[_UIViewControllerTransitionCoordinator _applyVoidBlocks:releaseBlocks:](auxContext, "_applyVoidBlocks:releaseBlocks:", v4, v5);

  }
}

- (NSArray)_containerViews
{
  return self->__containerViews;
}

- (void)_setContainerViews:(id)a3
{
  objc_storeStrong((id *)&self->__containerViews, a3);
}

- (double)_percentOffset
{
  return self->__percentOffset;
}

- (void)_setPercentOffset:(double)a3
{
  self->__percentOffset = a3;
}

- (UIViewControllerInteractiveTransitioning)_interactor
{
  return (UIViewControllerInteractiveTransitioning *)objc_loadWeakRetained((id *)&self->__interactor);
}

- (BOOL)_allowUserInteraction
{
  return self->__allowUserInteraction;
}

- (void)_setAllowUserInteraction:(BOOL)a3
{
  self->__allowUserInteraction = a3;
}

- (BOOL)_isRotating
{
  return self->_rotating;
}

- (BOOL)_needsBottomBarCrossfade
{
  return self->__needsBottomBarCrossfade;
}

- (void)_setNeedsBottomBarCrossfade:(BOOL)a3
{
  self->__needsBottomBarCrossfade = a3;
}

- (BOOL)_transitioningBottomBarIsTabBar
{
  return self->__transitioningBottomBarIsTabBar;
}

- (void)_setTransitioningBottomBarIsTabBar:(BOOL)a3
{
  self->__transitioningBottomBarIsTabBar = a3;
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (id)_didCompleteHandler
{
  return self->__didCompleteHandler;
}

- (BOOL)_initiallyInteractive
{
  return self->_initiallyInteractive;
}

- (void)_setInitiallyInteractive:(BOOL)a3
{
  self->_initiallyInteractive = a3;
}

- (void)_setCurrentlyInteractive:(BOOL)a3
{
  self->_currentlyInteractive = a3;
}

- (double)_completionVelocity
{
  return self->__completionVelocity;
}

- (void)_setCompletionVelocity:(double)a3
{
  self->__completionVelocity = a3;
}

- (int64_t)_completionCurve
{
  return self->__completionCurve;
}

- (id)_interactiveUpdateHandler
{
  return self->__interactiveUpdateHandler;
}

- (void)_setInteractiveUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)_setPostInteractiveCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (BOOL)_isPresentation
{
  return self->__isPresentation;
}

- (void)_setIsPresentation:(BOOL)a3
{
  self->__isPresentation = a3;
}

@end
