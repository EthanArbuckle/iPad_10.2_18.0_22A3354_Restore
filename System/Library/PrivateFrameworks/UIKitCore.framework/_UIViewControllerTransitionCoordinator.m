@implementation _UIViewControllerTransitionCoordinator

- (BOOL)isInteractive
{
  return -[_UIViewControllerTransitionContext isCurrentlyInteractive](self->__mainContext, "isCurrentlyInteractive");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__invalidationHandlers, 0);
  objc_storeStrong((id *)&self->__interactiveChangeHandlers, 0);
  objc_storeStrong((id *)&self->__alongsideCompletions, 0);
  objc_storeStrong((id *)&self->__alongsideAnimationViews, 0);
  objc_storeStrong((id *)&self->__alongsideAnimations, 0);
  objc_storeStrong((id *)&self->__systemAlongsideAnimations, 0);
}

- (void)_setInteractiveChangeHandlers:(id)a3
{
  objc_storeStrong((id *)&self->__interactiveChangeHandlers, a3);
}

- (NSMutableArray)_alongsideCompletions
{
  return self->__alongsideCompletions;
}

- (void)_applyBlocks:(id)a3 releaseBlocks:(id)a4
{
  void (**v6)(_QWORD);
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v9, "count"))
  {
    v6[2](v6);
    if (objc_msgSend(v9, "count"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        __UIVIEWCONTROLLERTRANSITIONCOORDINATOR_IS_EXECUTING_ALONGSIDE_ANIMATION_BLOCK__((uint64_t)self, (uint64_t)v8);

        ++v7;
      }
      while (v7 < objc_msgSend(v9, "count"));
    }
  }

}

- (NSMutableArray)_alongsideAnimations
{
  return self->__alongsideAnimations;
}

- (void)_setAlongsideAnimations:(id)a3
{
  objc_storeStrong((id *)&self->__alongsideAnimations, a3);
}

- (NSMutableArray)_systemAlongsideAnimations
{
  return self->__systemAlongsideAnimations;
}

- (_UIViewControllerTransitionCoordinator)initWithMainContext:(id)a3
{
  _UIViewControllerTransitionContext *v4;
  _UIViewControllerTransitionCoordinator *v5;
  _UIViewControllerTransitionCoordinator *v6;
  void *v7;
  objc_super v9;

  v4 = (_UIViewControllerTransitionContext *)a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewControllerTransitionCoordinator;
  v5 = -[_UIViewControllerTransitionCoordinator init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->__mainContext = v4;
    -[_UIViewControllerTransitionContext _auxContext](v4, "_auxContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      -[_UIViewControllerTransitionContext _setAuxContext:](v4, "_setAuxContext:", v6);
  }

  return v6;
}

- (void)_setAlongsideCompletions:(id)a3
{
  objc_storeStrong((id *)&self->__alongsideCompletions, a3);
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  return -[_UIViewControllerTransitionCoordinator _animateAlongsideTransitionInView:systemAnimation:systemCompletion:animation:completion:](self, "_animateAlongsideTransitionInView:systemAnimation:systemCompletion:animation:completion:", a3, 0, 0, a4, a5);
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return -[_UIViewControllerTransitionCoordinator _animateAlongsideTransitionInView:systemAnimation:systemCompletion:animation:completion:](self, "_animateAlongsideTransitionInView:systemAnimation:systemCompletion:animation:completion:", 0, 0, 0, a3, a4);
}

- (CGAffineTransform)targetTransform
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)self->__mainContext;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform targetTransform](result, "targetTransform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (double)transitionDuration
{
  double result;

  -[_UIViewControllerTransitionContext _duration](self->__mainContext, "_duration");
  return result;
}

- (UIView)containerView
{
  return -[_UIViewControllerTransitionContext containerView](self->__mainContext, "containerView");
}

- (BOOL)_animateAlongsideTransitionInView:(id)a3 systemAnimation:(BOOL)a4 systemCompletion:(BOOL)a5 animation:(id)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  BOOL v33;
  uint64_t v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id location;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD aBlock[5];
  id v49;
  BOOL v50;

  v9 = a5;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  -[_UIViewControllerTransitionCoordinator _mainContext](self, "_mainContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isInterruptible") & 1) == 0)
  {
    v16 = objc_msgSend(v15, "_transitionIsInFlight") ^ 1;
    if (!v13)
      goto LABEL_30;
LABEL_5:
    if (!v16)
      goto LABEL_30;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __130___UIViewControllerTransitionCoordinator__animateAlongsideTransitionInView_systemAnimation_systemCompletion_animation_completion___block_invoke;
    aBlock[3] = &unk_1E16BAFE8;
    v50 = a4;
    aBlock[4] = self;
    v17 = v13;
    v49 = v17;
    v18 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (!objc_msgSend(v15, "_ranAlongsideAnimations")
      || objc_msgSend(v15, "_transitionHasCompleted"))
    {
      v18[2](v18);
      if (!v12)
        goto LABEL_29;
      goto LABEL_25;
    }
    objc_msgSend(v15, "_animator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v19;
    v36 = v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v19, "interruptibleAnimatorForTransition:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    v21 = objc_msgSend(v20, "state");
    v38 = v20;
    if ((objc_opt_respondsToSelector() & 1) == 0 || v21 == 2 || v21 == 5)
    {
      if (+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled](UIViewPropertyAnimator, "_trackingAnimationsCurrentlyEnabled"))
      {
        objc_msgSend(v15, "_duration");
        v23 = v22;
        v24 = v37;
        v9 = v36;
        if ((objc_msgSend(v15, "isInteractive") & 1) != 0)
          v25 = 196608;
        else
          v25 = objc_msgSend(v15, "_completionCurve") << 16;
        v35 = v25;
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __130___UIViewControllerTransitionCoordinator__animateAlongsideTransitionInView_systemAnimation_systemCompletion_animation_completion___block_invoke_3;
        v44[3] = &unk_1E16B2F48;
        v44[4] = self;
        v45 = v17;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v35, v44, 0, v23, 0.0);

LABEL_24:
        if (!v12)
        {
LABEL_29:

          goto LABEL_30;
        }
LABEL_25:
        objc_msgSend(v15, "containerView");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v12, "isDescendantOfView:", v26);

        if ((v27 & 1) == 0)
        {
          -[_UIViewControllerTransitionCoordinator _alongsideAnimationViews](self, "_alongsideAnimationViews");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v28)
          {
            v28 = (void *)objc_opt_new();
            -[_UIViewControllerTransitionCoordinator _setAlongsideAnimationViews:](self, "_setAlongsideAnimationViews:", v28);
          }
          objc_msgSend(v28, "addObject:", v12);

        }
        goto LABEL_29;
      }
      v18[2](v18);
    }
    else
    {
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __130___UIViewControllerTransitionCoordinator__animateAlongsideTransitionInView_systemAnimation_systemCompletion_animation_completion___block_invoke_2;
      v46[3] = &unk_1E16B2F48;
      v46[4] = self;
      v47 = v17;
      objc_msgSend(v20, "addAnimations:", v46);

    }
    v24 = v37;
    v9 = v36;
    goto LABEL_24;
  }
  v16 = 1;
  if (v13)
    goto LABEL_5;
LABEL_30:
  if (v14)
  {
    if (v9)
    {
      objc_initWeak(&location, self);
      objc_msgSend(v15, "_willCompleteHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __130___UIViewControllerTransitionCoordinator__animateAlongsideTransitionInView_systemAnimation_systemCompletion_animation_completion___block_invoke_4;
      v39[3] = &unk_1E16C2790;
      v30 = v29;
      v40 = v30;
      v41 = v14;
      objc_copyWeak(&v42, &location);
      objc_msgSend(v15, "_setWillCompleteHandler:", v39);
      objc_destroyWeak(&v42);

      objc_destroyWeak(&location);
    }
    else
    {
      -[_UIViewControllerTransitionCoordinator _alongsideCompletions:](self, "_alongsideCompletions:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = _Block_copy(v14);
      objc_msgSend(v31, "addObject:", v32);

    }
  }
  if (v13)
    v33 = v16;
  else
    v33 = 1;

  return v33;
}

- (_UIViewControllerTransitionContext)_mainContext
{
  return self->__mainContext;
}

- (id)_alongsideAnimations:(BOOL)a3
{
  NSMutableArray *alongsideAnimations;
  BOOL v5;
  NSMutableArray *v6;
  NSMutableArray *v7;

  alongsideAnimations = self->__alongsideAnimations;
  if (alongsideAnimations)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->__alongsideAnimations;
    self->__alongsideAnimations = v6;

    alongsideAnimations = self->__alongsideAnimations;
  }
  return alongsideAnimations;
}

- (id)_alongsideCompletions:(BOOL)a3
{
  NSMutableArray *alongsideCompletions;
  BOOL v5;
  NSMutableArray *v6;
  NSMutableArray *v7;

  alongsideCompletions = self->__alongsideCompletions;
  if (alongsideCompletions)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->__alongsideCompletions;
    self->__alongsideCompletions = v6;

    alongsideCompletions = self->__alongsideCompletions;
  }
  return alongsideCompletions;
}

- (void)_setAlongsideAnimationViews:(id)a3
{
  objc_storeStrong((id *)&self->__alongsideAnimationViews, a3);
}

- (NSMutableArray)_alongsideAnimationViews
{
  return self->__alongsideAnimationViews;
}

- (void)notifyWhenInteractionChangesUsingBlock:(id)a3
{
  void *v4;
  void *v5;
  void *aBlock;

  if (a3)
  {
    aBlock = (void *)objc_msgSend(a3, "copy");
    -[_UIViewControllerTransitionCoordinator _interactiveChangeHandlers:](self, "_interactiveChangeHandlers:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _Block_copy(aBlock);
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)_interactiveChangeHandlers:(BOOL)a3
{
  NSMutableArray *interactiveChangeHandlers;
  BOOL v5;
  NSMutableArray *v6;
  NSMutableArray *v7;

  interactiveChangeHandlers = self->__interactiveChangeHandlers;
  if (interactiveChangeHandlers)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->__interactiveChangeHandlers;
    self->__interactiveChangeHandlers = v6;

    interactiveChangeHandlers = self->__interactiveChangeHandlers;
  }
  return interactiveChangeHandlers;
}

- (BOOL)isCancelled
{
  return -[_UIViewControllerTransitionContext transitionWasCancelled](self->__mainContext, "transitionWasCancelled");
}

- (BOOL)isAnimated
{
  return -[_UIViewControllerTransitionContext isAnimated](self->__mainContext, "isAnimated");
}

- (int64_t)presentationStyle
{
  return -[_UIViewControllerTransitionContext presentationStyle](self->__mainContext, "presentationStyle");
}

- (BOOL)initiallyInteractive
{
  return -[_UIViewControllerTransitionContext _initiallyInteractive](self->__mainContext, "_initiallyInteractive");
}

- (BOOL)isInterruptible
{
  return -[_UIViewControllerTransitionContext isInterruptible](self->__mainContext, "isInterruptible");
}

- (BOOL)isCompleting
{
  return -[_UIViewControllerTransitionContext _transitionIsCompleting](self->__mainContext, "_transitionIsCompleting");
}

- (double)percentComplete
{
  double result;

  -[_UIViewControllerTransitionContext _previousPercentComplete](self->__mainContext, "_previousPercentComplete");
  return result;
}

- (double)completionVelocity
{
  double result;

  -[_UIViewControllerTransitionContext _completionVelocity](self->__mainContext, "_completionVelocity");
  return result;
}

- (int64_t)completionCurve
{
  return -[_UIViewControllerTransitionContext _completionCurve](self->__mainContext, "_completionCurve");
}

- (id)viewControllerForKey:(id)a3
{
  return -[_UIViewControllerTransitionContext viewControllerForKey:](self->__mainContext, "viewControllerForKey:", a3);
}

- (id)viewForKey:(id)a3
{
  return -[_UIViewControllerTransitionContext viewForKey:](self->__mainContext, "viewForKey:", a3);
}

- (BOOL)isRotating
{
  return -[_UIViewControllerTransitionContext _isRotating](self->__mainContext, "_isRotating");
}

- (CGAffineTransform)affineTransform
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)self->__mainContext;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform _affineTransform](result, "_affineTransform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (id)_systemAlongsideAnimations:(BOOL)a3
{
  NSMutableArray *systemAlongsideAnimations;
  BOOL v5;
  NSMutableArray *v6;
  NSMutableArray *v7;

  systemAlongsideAnimations = self->__systemAlongsideAnimations;
  if (systemAlongsideAnimations)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->__systemAlongsideAnimations;
    self->__systemAlongsideAnimations = v6;

    systemAlongsideAnimations = self->__systemAlongsideAnimations;
  }
  return systemAlongsideAnimations;
}

- (id)_invalidationHandlers:(BOOL)a3
{
  NSMutableArray *invalidationHandlers;
  BOOL v5;
  NSMutableArray *v6;
  NSMutableArray *v7;

  invalidationHandlers = self->__invalidationHandlers;
  if (invalidationHandlers)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->__invalidationHandlers;
    self->__invalidationHandlers = v6;

    invalidationHandlers = self->__invalidationHandlers;
  }
  return invalidationHandlers;
}

- (void)_applyVoidBlocks:(id)a3 releaseBlocks:(id)a4
{
  void (**v5)(_QWORD);
  unint64_t v6;
  void (**v7)(void);
  id v8;

  v8 = a3;
  v5 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v8, "count"))
  {
    v5[2](v5);
    if (objc_msgSend(v8, "count"))
    {
      v6 = 0;
      do
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
        v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v7[2]();

        ++v6;
      }
      while (v6 < objc_msgSend(v8, "count"));
    }
  }

}

- (void)_addInvalidationHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[_UIViewControllerTransitionCoordinator _invalidationHandlers:](self, "_invalidationHandlers:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = _Block_copy(v4);

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (void)_setMainContext:(id)a3
{
  self->__mainContext = (_UIViewControllerTransitionContext *)a3;
}

- (void)_setSystemAlongsideAnimations:(id)a3
{
  objc_storeStrong((id *)&self->__systemAlongsideAnimations, a3);
}

- (NSMutableArray)_interactiveChangeHandlers
{
  return self->__interactiveChangeHandlers;
}

- (NSMutableArray)_invalidationHandlers
{
  return self->__invalidationHandlers;
}

- (void)_setInvalidationHandlers:(id)a3
{
  objc_storeStrong((id *)&self->__invalidationHandlers, a3);
}

@end
