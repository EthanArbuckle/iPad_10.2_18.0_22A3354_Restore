@implementation PUModalTransition

- (void)imageModulationIntensityDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUModalTransition;
  -[PUViewControllerTransition imageModulationIntensityDidChange](&v4, sel_imageModulationIntensityDidChange);
  -[PUModalTransition presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_setNeedsImageModulationIntensityUpdate");

}

- (id)presentingViewController
{
  int64_t v3;
  void *v4;

  v3 = -[PUModalTransition _operation](self, "_operation");
  if (v3 == 1)
  {
    -[PUViewControllerTransition toViewController](self, "toViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[PUViewControllerTransition fromViewController](self, "fromViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)finishInteractiveTransition
{
  objc_super v3;

  if (-[PUViewControllerTransition isInteractive](self, "isInteractive"))
  {
    if (-[PUModalTransition _operation](self, "_operation"))
    {
      if (-[PUModalTransition _operation](self, "_operation") == 1)
        -[PUModalTransition completeInteractiveDismissTransitionFinished:](self, "completeInteractiveDismissTransitionFinished:", 1);
    }
    else
    {
      -[PUModalTransition completeInteractivePresentTransitionFinished:](self, "completeInteractivePresentTransitionFinished:", 1);
    }
  }
  v3.receiver = self;
  v3.super_class = (Class)PUModalTransition;
  -[PUViewControllerTransition finishInteractiveTransition](&v3, sel_finishInteractiveTransition);
}

- (void)cancelInteractiveTransition
{
  objc_super v3;

  if (-[PUViewControllerTransition isInteractive](self, "isInteractive"))
  {
    if (-[PUModalTransition _operation](self, "_operation"))
    {
      if (-[PUModalTransition _operation](self, "_operation") == 1)
        -[PUModalTransition completeInteractiveDismissTransitionFinished:](self, "completeInteractiveDismissTransitionFinished:", 0);
    }
    else
    {
      -[PUModalTransition completeInteractivePresentTransitionFinished:](self, "completeInteractivePresentTransitionFinished:", 0);
    }
  }
  v3.receiver = self;
  v3.super_class = (Class)PUModalTransition;
  -[PUViewControllerTransition cancelInteractiveTransition](&v3, sel_cancelInteractiveTransition);
}

- (void)animateTransition:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUModalTransition;
  -[PUViewControllerTransition animateTransition:](&v4, sel_animateTransition_, a3);
  if (-[PUModalTransition _operation](self, "_operation"))
  {
    if (-[PUModalTransition _operation](self, "_operation") == 1)
      -[PUModalTransition animateDismissTransition](self, "animateDismissTransition");
  }
  else
  {
    -[PUModalTransition animatePresentTransition](self, "animatePresentTransition");
  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  -[PUModalTransition _setOperation:](self, "_setOperation:", 0, a4, a5);
  -[PUModalTransition transitionWillPresentInteractively:](self, "transitionWillPresentInteractively:", -[PUViewControllerTransition isInteractive](self, "isInteractive"));
  return self;
}

- (id)animationControllerForDismissedController:(id)a3
{
  -[PUModalTransition _setOperation:](self, "_setOperation:", 1);
  -[PUModalTransition transitionWillDismissInteractively:](self, "transitionWillDismissInteractively:", -[PUViewControllerTransition isInteractive](self, "isInteractive"));
  return self;
}

- (id)interactionControllerForPresentation:(id)a3
{
  -[PUModalTransition _setOperation:](self, "_setOperation:", 0);
  return -[PUViewControllerTransition interactiveTransition](self, "interactiveTransition");
}

- (id)interactionControllerForDismissal:(id)a3
{
  -[PUModalTransition _setOperation:](self, "_setOperation:", 1);
  return -[PUViewControllerTransition interactiveTransition](self, "interactiveTransition");
}

- (int64_t)_operation
{
  return self->__operation;
}

- (void)_setOperation:(int64_t)a3
{
  self->__operation = a3;
}

@end
