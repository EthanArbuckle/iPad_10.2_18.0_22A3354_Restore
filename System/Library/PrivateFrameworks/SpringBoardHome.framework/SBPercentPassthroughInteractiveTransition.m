@implementation SBPercentPassthroughInteractiveTransition

- (SBPercentPassthroughInteractiveTransition)init
{
  SBPercentPassthroughInteractiveTransition *v2;
  SBPercentPassthroughInteractiveTransition *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPercentPassthroughInteractiveTransition;
  v2 = -[SBPercentPassthroughInteractiveTransition init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SBPercentPassthroughInteractiveTransition setCompletionSpeed:](v2, "setCompletionSpeed:", 1.0);
    -[SBPercentPassthroughInteractiveTransition setCompletionCurve:](v3, "setCompletionCurve:", 0);
  }
  return v3;
}

- (void)updateTransition:(double)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  objc_msgSend(WeakRetained, "updateInteractiveTransition:", a3);

}

- (void)finishInteractiveTransition
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  objc_msgSend(WeakRetained, "finishInteractiveTransition");

}

- (void)cancelTransition
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  objc_msgSend(WeakRetained, "cancelTransition");

}

- (void)startInteractiveTransition:(id)a3
{
  objc_storeWeak((id *)&self->_transitionContext, a3);
}

- (BOOL)supportsRestarting
{
  return 1;
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
  objc_destroyWeak((id *)&self->_transitionContext);
}

@end
