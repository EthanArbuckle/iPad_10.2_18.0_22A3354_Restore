@implementation SBSpotlightTransitionInteractor

- (SBSpotlightTransitionInteractor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSpotlightTransitionAnimator.m"), 374, CFSTR("use initWithAnimator:..."));

  return 0;
}

- (SBSpotlightTransitionInteractor)initWithAnimator:(id)a3
{
  id v4;
  SBSpotlightTransitionInteractor *v5;
  SBSpotlightTransitionInteractor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSpotlightTransitionInteractor;
  v5 = -[SBSpotlightTransitionInteractor init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_animator, v4);
    -[SBSpotlightTransitionInteractor setCompletionSpeed:](v6, "setCompletionSpeed:", 1.0);
    -[SBSpotlightTransitionInteractor setCompletionCurve:](v6, "setCompletionCurve:", 0);
  }

  return v6;
}

- (void)updateTransition:(double)a3
{
  -[SBViewControllerContextTransitioning updateInteractiveTransition:](self->_transitionContext, "updateInteractiveTransition:", fmin(fmax(a3, 0.0), 1.0));
}

- (void)startInteractiveTransition:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->_transitionContext, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_animator);
  objc_msgSend(WeakRetained, "animateTransition:", self->_transitionContext);

}

- (double)completionSpeed
{
  return self->_completionSpeed;
}

- (void)setCompletionSpeed:(double)a3
{
  self->_completionSpeed = a3;
}

- (int64_t)completionCurve
{
  return self->_completionCurve;
}

- (void)setCompletionCurve:(int64_t)a3
{
  self->_completionCurve = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animator);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end
