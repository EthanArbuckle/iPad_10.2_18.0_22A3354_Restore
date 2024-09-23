@implementation PRXPurelyInteractiveTransition

- (void)finishInteractiveTransition
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRXPurelyInteractiveTransition;
  -[UIPercentDrivenInteractiveTransition finishInteractiveTransition](&v4, sel_finishInteractiveTransition);
  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  objc_msgSend(WeakRetained, "completeTransition:", 1);

}

- (void)cancelInteractiveTransition
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRXPurelyInteractiveTransition;
  -[UIPercentDrivenInteractiveTransition cancelInteractiveTransition](&v4, sel_cancelInteractiveTransition);
  WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  objc_msgSend(WeakRetained, "completeTransition:", 0);

}

- (void)animateTransition:(id)a3
{
  objc_storeWeak((id *)&self->_transitionContext, a3);
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitionContext);
}

@end
