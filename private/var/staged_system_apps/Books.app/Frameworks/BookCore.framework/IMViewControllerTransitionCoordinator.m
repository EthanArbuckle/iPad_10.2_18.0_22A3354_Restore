@implementation IMViewControllerTransitionCoordinator

- (IMViewControllerTransitionCoordinator)initWithMainContext:(id)a3
{
  IMViewControllerTransitionContext *v4;
  IMViewControllerTransitionCoordinator *v5;
  IMViewControllerTransitionCoordinator *v6;
  void *v7;
  objc_super v9;

  v4 = (IMViewControllerTransitionContext *)a3;
  v9.receiver = self;
  v9.super_class = (Class)IMViewControllerTransitionCoordinator;
  v5 = -[IMViewControllerTransitionCoordinator init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    v5->__mainContext = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransitionContext _auxContext](v4, "_auxContext"));

    if (!v7)
      -[IMViewControllerTransitionContext _setAuxContext:](v4, "_setAuxContext:", v6);
  }

  return v6;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (BOOL)isAnimated
{
  return -[IMViewControllerTransitionContext isAnimated](self->__mainContext, "isAnimated");
}

- (int64_t)presentationStyle
{
  return -[IMViewControllerTransitionContext presentationStyle](self->__mainContext, "presentationStyle");
}

- (BOOL)initiallyInteractive
{
  return -[IMViewControllerTransitionContext initiallyInteractive](self->__mainContext, "initiallyInteractive");
}

- (BOOL)isInteractive
{
  return -[IMViewControllerTransitionContext isCurrentlyInteractive](self->__mainContext, "isCurrentlyInteractive");
}

- (BOOL)isCancelled
{
  return -[IMViewControllerTransitionContext transitionWasCancelled](self->__mainContext, "transitionWasCancelled");
}

- (BOOL)isCompleting
{
  return -[IMViewControllerTransitionContext _transitionIsCompleting](self->__mainContext, "_transitionIsCompleting");
}

- (double)percentComplete
{
  double result;

  -[IMViewControllerTransitionContext _previousPercentComplete](self->__mainContext, "_previousPercentComplete");
  return result;
}

- (double)completionVelocity
{
  double result;

  -[IMViewControllerTransitionContext _completionVelocity](self->__mainContext, "_completionVelocity");
  return result;
}

- (int64_t)completionCurve
{
  return -[IMViewControllerTransitionContext _completionCurve](self->__mainContext, "_completionCurve");
}

- (double)transitionDuration
{
  double result;

  -[IMViewControllerTransitionContext duration](self->__mainContext, "duration");
  return result;
}

- (id)viewControllerForKey:(id)a3
{
  return -[IMViewControllerTransitionContext viewControllerForKey:](self->__mainContext, "viewControllerForKey:", a3);
}

- (id)viewForKey:(id)a3
{
  return -[IMViewControllerTransitionContext viewForKey:](self->__mainContext, "viewForKey:", a3);
}

- (UIView)containerView
{
  return -[IMViewControllerTransitionContext containerView](self->__mainContext, "containerView");
}

- (BOOL)isRotating
{
  return 0;
}

- (CGAffineTransform)affineTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
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

- (NSMutableArray)_interactiveChangeHandlers
{
  return self->__interactiveChangeHandlers;
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
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->__interactiveChangeHandlers;
    self->__interactiveChangeHandlers = v6;

    interactiveChangeHandlers = self->__interactiveChangeHandlers;
  }
  return interactiveChangeHandlers;
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
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->__alongsideAnimations;
    self->__alongsideAnimations = v6;

    alongsideAnimations = self->__alongsideAnimations;
  }
  return alongsideAnimations;
}

- (NSMutableArray)_alongsideAnimations
{
  return self->__alongsideAnimations;
}

- (NSMutableArray)_alongsideCompletions
{
  return self->__alongsideCompletions;
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
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->__alongsideCompletions;
    self->__alongsideCompletions = v6;

    alongsideCompletions = self->__alongsideCompletions;
  }
  return alongsideCompletions;
}

- (void)_applyBlocks:(id)a3 releaseBlocks:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    v7[2](v7);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        v14 = v11;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v8);
          v11 = objc_retainBlock(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13));

          (*((void (**)(id, IMViewControllerTransitionCoordinator *))v11 + 2))(v11, self);
          v13 = (char *)v13 + 1;
          v14 = v11;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);

    }
  }

}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  NSMutableArray *v19;
  id v20;
  void *v21;
  id v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransitionCoordinator _mainContext](self, "_mainContext"));
  v12 = objc_msgSend(v11, "_transitionIsInFlight");

  if (v9 && (v12 & 1) == 0)
  {
    v13 = objc_msgSend(v9, "copy");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransitionCoordinator _alongsideAnimations:](self, "_alongsideAnimations:", 1));
    v15 = objc_retainBlock(v13);
    objc_msgSend(v14, "addObject:", v15);

    if (v8)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransitionCoordinator _mainContext](self, "_mainContext"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "containerView"));
      v18 = objc_msgSend(v8, "isDescendantOfView:", v17);

      if ((v18 & 1) == 0)
      {
        v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransitionCoordinator _alongsideAnimationViews](self, "_alongsideAnimationViews"));
        if (!v19)
        {
          v19 = objc_opt_new(NSMutableArray);
          -[IMViewControllerTransitionCoordinator _setAlongsideAnimationViews:](self, "_setAlongsideAnimationViews:", v19);
        }
        -[NSMutableArray addObject:](v19, "addObject:", v8);

      }
    }

  }
  if (v10)
  {
    v20 = objc_msgSend(v10, "copy");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransitionCoordinator _alongsideCompletions:](self, "_alongsideCompletions:", 1));
    v22 = objc_retainBlock(v20);
    objc_msgSend(v21, "addObject:", v22);

  }
  if (v9)
    v23 = v12 ^ 1;
  else
    v23 = 1;

  return v23;
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return -[IMViewControllerTransitionCoordinator animateAlongsideTransitionInView:animation:completion:](self, "animateAlongsideTransitionInView:animation:completion:", 0, a3, a4);
}

- (void)notifyWhenInteractionChangesUsingBlock:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v6 = objc_msgSend(a3, "copy");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransitionCoordinator _interactiveChangeHandlers:](self, "_interactiveChangeHandlers:", 1));
    v5 = objc_retainBlock(v6);
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)notifyWhenInteractionEndsUsingBlock:(id)a3
{
  -[IMViewControllerTransitionCoordinator notifyWhenInteractionChangesUsingBlock:](self, "notifyWhenInteractionChangesUsingBlock:", a3);
}

- (void)handlerToInvokeOnInteractivityChanges:(id)a3
{
  -[IMViewControllerTransitionCoordinator notifyWhenInteractionChangesUsingBlock:](self, "notifyWhenInteractionChangesUsingBlock:", a3);
}

- (IMViewControllerTransitionContext)_mainContext
{
  return self->__mainContext;
}

- (void)_setMainContext:(id)a3
{
  self->__mainContext = (IMViewControllerTransitionContext *)a3;
}

- (void)_setAlongsideAnimations:(id)a3
{
  objc_storeStrong((id *)&self->__alongsideAnimations, a3);
}

- (NSMutableArray)_alongsideAnimationViews
{
  return self->__alongsideAnimationViews;
}

- (void)_setAlongsideAnimationViews:(id)a3
{
  objc_storeStrong((id *)&self->__alongsideAnimationViews, a3);
}

- (void)_setAlongsideCompletions:(id)a3
{
  objc_storeStrong((id *)&self->__alongsideCompletions, a3);
}

- (void)_setInteractiveChangeHandlers:(id)a3
{
  objc_storeStrong((id *)&self->__interactiveChangeHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__interactiveChangeHandlers, 0);
  objc_storeStrong((id *)&self->__alongsideCompletions, 0);
  objc_storeStrong((id *)&self->__alongsideAnimationViews, 0);
  objc_storeStrong((id *)&self->__alongsideAnimations, 0);
}

@end
