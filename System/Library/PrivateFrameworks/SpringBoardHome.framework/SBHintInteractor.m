@implementation SBHintInteractor

- (SBHintInteractor)initWithInteractionProgress:(id)a3 maxHintProgress:(double)a4
{
  id v7;
  SBHintInteractor *v8;
  SBHintInteractor *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHintInteractor;
  v8 = -[SBHintInteractor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_interactionProgress, a3);
    v9->_hintInterval.start.value = 0.0;
    v9->_hintInterval.start.inclusive = 1;
    *(_DWORD *)(&v9->_hintInterval.start.inclusive + 1) = 0;
    *((_DWORD *)&v9->_hintInterval.start.inclusive + 1) = 0;
    v9->_hintInterval.end.value = a4;
    v9->_hintInterval.end.inclusive = 1;
    *(_DWORD *)(&v9->_hintInterval.end.inclusive + 1) = 0;
    *((_DWORD *)&v9->_hintInterval.end.inclusive + 1) = 0;
  }

  return v9;
}

- (double)maxHintProgress
{
  double result;

  BSIntervalMax();
  return result;
}

- (void)startInteractiveTransition:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_transitionContext, a3);
  -[SBHintInteractor interactionProgress](self, "interactionProgress");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addProgressObserver:", self);
  objc_msgSend(v4, "percentComplete");
  -[SBHintInteractor _updateInteractionPercentComplete:](self, "_updateInteractionPercentComplete:");

}

- (void)updateTransition:(double)a3
{
  -[SBViewControllerContextTransitioning updateInteractiveTransition:](self->_transitionContext, "updateInteractiveTransition:", a3);
}

- (void)cancelTransition
{
  -[SBViewControllerContextTransitioning cancelInteractiveTransition](self->_transitionContext, "cancelInteractiveTransition");
}

- (void)finishInteractiveTransition
{
  -[SBViewControllerContextTransitioning finishInteractiveTransition](self->_transitionContext, "finishInteractiveTransition");
}

- (BOOL)supportsRestarting
{
  return 1;
}

- (void)interactionProgressDidUpdate:(id)a3
{
  objc_msgSend(a3, "percentComplete");
  -[SBHintInteractor _updateInteractionPercentComplete:](self, "_updateInteractionPercentComplete:");
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (-[SBViewControllerContextTransitioning isInteractive](self->_transitionContext, "isInteractive"))
  {
    objc_msgSend(v6, "removeProgressObserver:", self);
    if (v4)
      -[SBHintInteractor finishInteractiveTransition](self, "finishInteractiveTransition");
    else
      -[SBHintInteractor cancelTransition](self, "cancelTransition");
  }

}

- (void)_updateInteractionPercentComplete:(double)a3
{
  double v4;
  double v5;
  $8CEC7ECD3C838BAAC8EC71F30D71A7D3 hintInterval;

  hintInterval = self->_hintInterval;
  BSIntervalValueForFraction();
  v5 = v4;
  -[SBViewControllerContextTransitioning percentComplete](self->_transitionContext, "percentComplete", *(_OWORD *)&hintInterval.start, *(_OWORD *)&hintInterval.end);
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    if (-[SBViewControllerContextTransitioning isInteractive](self->_transitionContext, "isInteractive"))
      -[SBHintInteractor updateTransition:](self, "updateTransition:", v5);
  }
}

- (UIInteractionProgress)interactionProgress
{
  return self->_interactionProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionProgress, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end
