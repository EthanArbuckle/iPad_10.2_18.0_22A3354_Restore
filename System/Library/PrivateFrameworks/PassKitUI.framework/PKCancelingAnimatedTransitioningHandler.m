@implementation PKCancelingAnimatedTransitioningHandler

- (void)_updateWithTransitionContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  objc_storeStrong((id *)&self->_transitionContext, a3);
  v5 = a3;
  objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForKey:", *MEMORY[0x1E0DC55C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_presentingVC, obj);
  objc_storeWeak((id *)&self->_presentingView, v6);
  objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForKey:", *MEMORY[0x1E0DC55D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeWeak((id *)&self->_presentedVC, v7);
  objc_storeWeak((id *)&self->_presentedView, v8);

}

- (double)transitionDuration:(id)a3
{
  -[PKCancelingAnimatedTransitioningHandler _updateWithTransitionContext:](self, "_updateWithTransitionContext:", a3);
  return 0.0;
}

- (void)animationEnded:(BOOL)a3
{
  void (**cancelationHandler)(id, id);
  id WeakRetained;
  id v6;
  UIViewControllerContextTransitioning *transitionContext;

  if (!self->_completed)
  {
    cancelationHandler = (void (**)(id, id))self->_cancelationHandler;
    if (cancelationHandler)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_presentingVC);
      cancelationHandler[2](cancelationHandler, WeakRetained);

      v6 = self->_cancelationHandler;
      self->_cancelationHandler = 0;

    }
    self->_completed = 1;
    objc_storeWeak((id *)&self->_presentingView, 0);
    objc_storeWeak((id *)&self->_presentingVC, 0);
    objc_storeWeak((id *)&self->_presentedVC, 0);
    objc_storeWeak((id *)&self->_presentedView, 0);
    transitionContext = self->_transitionContext;
    self->_transitionContext = 0;

  }
}

- (void)startInteractiveTransition:(id)a3
{
  -[PKCancelingAnimatedTransitioningHandler _updateWithTransitionContext:](self, "_updateWithTransitionContext:", a3);
  -[UIViewControllerContextTransitioning pauseInteractiveTransition](self->_transitionContext, "pauseInteractiveTransition");
  -[UIViewControllerContextTransitioning cancelInteractiveTransition](self->_transitionContext, "cancelInteractiveTransition");
  -[UIViewControllerContextTransitioning completeTransition:](self->_transitionContext, "completeTransition:", 0);
}

- (BOOL)wantsInteractiveStart
{
  return 0;
}

- (id)cancelationHandler
{
  return self->_cancelationHandler;
}

- (void)setCancelationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelationHandler, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_destroyWeak((id *)&self->_presentedView);
  objc_destroyWeak((id *)&self->_presentedVC);
  objc_destroyWeak((id *)&self->_presentingView);
  objc_destroyWeak((id *)&self->_presentingVC);
}

@end
