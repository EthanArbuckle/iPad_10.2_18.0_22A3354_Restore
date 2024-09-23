@implementation PUViewControllerTransition

- (PUViewControllerTransition)initWithDuration:(double)a3
{
  PUViewControllerTransition *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUViewControllerTransition;
  result = -[PUViewControllerTransition init](&v5, sel_init);
  if (result)
    result->_duration = a3;
  return result;
}

- (id)_newInteractiveTransition
{
  return objc_alloc_init(MEMORY[0x1E0DC3AD0]);
}

- (void)setStartedInteractively:(BOOL)a3
{
  self->_startedInteractively = a3;
  -[PUViewControllerTransition _setInteractive:](self, "_setInteractive:");
}

- (void)setVisibleInteractiveProgress:(double)a3
{
  if (self->_visibleInteractiveProgress != a3)
  {
    self->_visibleInteractiveProgress = a3;
    -[PUViewControllerTransition imageModulationIntensityDidChange](self, "imageModulationIntensityDidChange");
  }
}

- (double)imageModulationIntensity
{
  double *v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v11;

  v4 = (double *)MEMORY[0x1E0D7C400];
  if (!-[PUViewControllerTransition isInteractive](self, "isInteractive"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUViewControllerTransition.m"), 71, CFSTR("undefined for non-interactive transition"));

  }
  v5 = *v4;
  -[PUViewControllerTransition visibleInteractiveProgress](self, "visibleInteractiveProgress");
  -[PUViewControllerTransition fromViewController](self, "fromViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition toViewController](self, "toViewController");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    objc_msgSend(v6, "px_imageModulationIntensity");
    objc_msgSend(v8, "px_imageModulationIntensity");
    PXFloatByLinearlyInterpolatingFloats();
    v5 = v9;
  }

  return v5;
}

- (void)updateInteractiveTransitionProgress:(double)a3
{
  -[PUViewControllerTransition updateInteractiveTransitionProgress:visibleTransitionProgress:](self, "updateInteractiveTransitionProgress:visibleTransitionProgress:", a3, a3);
}

- (void)updateInteractiveTransitionProgress:(double)a3 visibleTransitionProgress:(double)a4
{
  double v7;

  if (-[PUViewControllerTransition isInteractive](self, "isInteractive"))
  {
    -[PUViewControllerTransition _setInteractiveProgress:](self, "_setInteractiveProgress:", a3);
    v7 = 0.0;
    if (a4 >= 0.0)
      v7 = a4;
    -[PUViewControllerTransition setVisibleInteractiveProgress:](self, "setVisibleInteractiveProgress:", fmin(v7, 1.0));
    -[UIPercentDrivenInteractiveTransition updateInteractiveTransition:](self->_interactiveTransition, "updateInteractiveTransition:", fmin(a3, 0.999000013));
  }
}

- (void)finishInteractiveTransition
{
  if (-[PUViewControllerTransition isInteractive](self, "isInteractive"))
    -[UIPercentDrivenInteractiveTransition finishInteractiveTransition](self->_interactiveTransition, "finishInteractiveTransition");
}

- (void)cancelInteractiveTransition
{
  if (-[PUViewControllerTransition isInteractive](self, "isInteractive"))
    -[UIPercentDrivenInteractiveTransition cancelInteractiveTransition](self->_interactiveTransition, "cancelInteractiveTransition");
}

- (id)interactiveTransition
{
  UIPercentDrivenInteractiveTransition *v3;
  UIPercentDrivenInteractiveTransition *interactiveTransition;

  if (-[PUViewControllerTransition isInteractive](self, "isInteractive") && !self->_interactiveTransition)
  {
    v3 = -[PUViewControllerTransition _newInteractiveTransition](self, "_newInteractiveTransition");
    interactiveTransition = self->_interactiveTransition;
    self->_interactiveTransition = v3;

  }
  return self->_interactiveTransition;
}

- (id)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (id)fromViewController
{
  return (id)-[UIViewControllerContextTransitioning viewControllerForKey:](self->_transitionContext, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
}

- (id)toViewController
{
  return (id)-[UIViewControllerContextTransitioning viewControllerForKey:](self->_transitionContext, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
}

- (id)containerView
{
  return (id)-[UIViewControllerContextTransitioning containerView](self->_transitionContext, "containerView");
}

- (CGRect)initialFromViewFrame
{
  UIViewControllerContextTransitioning *transitionContext;
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

  transitionContext = self->_transitionContext;
  -[PUViewControllerTransition fromViewController](self, "fromViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewControllerContextTransitioning initialFrameForViewController:](transitionContext, "initialFrameForViewController:", v3);
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

- (CGRect)initialToViewFrame
{
  UIViewControllerContextTransitioning *transitionContext;
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

  transitionContext = self->_transitionContext;
  -[PUViewControllerTransition toViewController](self, "toViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewControllerContextTransitioning initialFrameForViewController:](transitionContext, "initialFrameForViewController:", v3);
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

- (CGRect)finalFromViewFrame
{
  UIViewControllerContextTransitioning *transitionContext;
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

  transitionContext = self->_transitionContext;
  -[PUViewControllerTransition fromViewController](self, "fromViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewControllerContextTransitioning finalFrameForViewController:](transitionContext, "finalFrameForViewController:", v3);
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

- (CGRect)finalToViewFrame
{
  UIViewControllerContextTransitioning *transitionContext;
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

  transitionContext = self->_transitionContext;
  -[PUViewControllerTransition toViewController](self, "toViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewControllerContextTransitioning finalFrameForViewController:](transitionContext, "finalFrameForViewController:", v3);
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

- (void)completeTransition:(BOOL)a3
{
  -[UIViewControllerContextTransitioning completeTransition:](self->_transitionContext, "completeTransition:", a3);
}

- (void)animateTransition:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (void)animationEnded:(BOOL)a3
{
  UIViewControllerContextTransitioning *transitionContext;
  UIPercentDrivenInteractiveTransition *interactiveTransition;

  transitionContext = self->_transitionContext;
  self->_transitionContext = 0;

  interactiveTransition = self->_interactiveTransition;
  self->_interactiveTransition = 0;

  -[PUViewControllerTransition setStartedInteractively:](self, "setStartedInteractively:", 0);
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void)_setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (double)interactiveProgress
{
  return self->_interactiveProgress;
}

- (void)_setInteractiveProgress:(double)a3
{
  self->_interactiveProgress = a3;
}

- (double)visibleInteractiveProgress
{
  return self->_visibleInteractiveProgress;
}

- (BOOL)startedInteractively
{
  return self->_startedInteractively;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactiveTransition, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

+ (id)interactionControllerForAnimationController:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "interactiveTransition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
