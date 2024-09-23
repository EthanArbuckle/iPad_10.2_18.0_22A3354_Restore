@implementation PUNavigationTransition

+ (BOOL)shouldCrossFadeBottomBarsForNavigationController:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_navigationTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_operation") != 0;

  return v5;
}

- (PUNavigationTransition)initWithDuration:(double)a3
{
  return -[PUNavigationTransition initWithPushDuration:popDuration:](self, "initWithPushDuration:popDuration:", a3, a3);
}

- (PUNavigationTransition)initWithPushDuration:(double)a3 popDuration:(double)a4
{
  PUNavigationTransition *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUNavigationTransition;
  result = -[PUViewControllerTransition initWithDuration:](&v7, sel_initWithDuration_);
  if (result)
  {
    result->_pushDuration = a3;
    result->_popDuration = a4;
  }
  return result;
}

- (void)imageModulationIntensityDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUNavigationTransition;
  -[PUViewControllerTransition imageModulationIntensityDidChange](&v4, sel_imageModulationIntensityDidChange);
  -[PUNavigationTransition navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_setNeedsImageModulationIntensityUpdate");

}

- (void)finishInteractiveTransition
{
  objc_super v3;

  if (-[PUViewControllerTransition isInteractive](self, "isInteractive"))
    -[PUNavigationTransition completeInteractiveOperation:finished:](self, "completeInteractiveOperation:finished:", -[PUNavigationTransition _operation](self, "_operation"), 1);
  v3.receiver = self;
  v3.super_class = (Class)PUNavigationTransition;
  -[PUViewControllerTransition finishInteractiveTransition](&v3, sel_finishInteractiveTransition);
}

- (void)cancelInteractiveTransition
{
  objc_super v3;

  if (-[PUViewControllerTransition isInteractive](self, "isInteractive"))
    -[PUNavigationTransition completeInteractiveOperation:finished:](self, "completeInteractiveOperation:finished:", -[PUNavigationTransition _operation](self, "_operation"), 0);
  v3.receiver = self;
  v3.super_class = (Class)PUNavigationTransition;
  -[PUViewControllerTransition cancelInteractiveTransition](&v3, sel_cancelInteractiveTransition);
}

- (void)didCompleteTransitionAnimation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUNavigationTransition;
  -[PUViewControllerTransition didCompleteTransitionAnimation](&v4, sel_didCompleteTransitionAnimation);
  -[PUNavigationTransition navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ppt_notifyTransitionAnimationDidComplete");

}

- (void)completeTransition:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[PUNavigationTransition navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pu_navigationTransitionWillEnd:", self);
  -[PUNavigationTransition _setOperation:](self, "_setOperation:", 0);
  v6.receiver = self;
  v6.super_class = (Class)PUNavigationTransition;
  -[PUViewControllerTransition completeTransition:](&v6, sel_completeTransition_, v3);
  objc_msgSend(v5, "pu_navigationTransitionDidEnd:", self);

}

- (double)transitionDuration:(id)a3
{
  unint64_t v4;
  double result;

  v4 = -[PUNavigationTransition _operation](self, "_operation", a3);
  if (v4 >= 2)
  {
    if (v4 == 2)
      -[PUNavigationTransition popDuration](self, "popDuration");
    else
      return 0.0;
  }
  else
  {
    -[PUViewControllerTransition duration](self, "duration");
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  int64_t operation;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUNavigationTransition;
  -[PUViewControllerTransition animateTransition:](&v5, sel_animateTransition_, a3);
  operation = self->__operation;
  if (operation == 2)
  {
    -[PUNavigationTransition animatePopTransition](self, "animatePopTransition");
  }
  else if (operation == 1)
  {
    -[PUNavigationTransition animatePushTransition](self, "animatePushTransition");
  }
}

- (void)transitionWillStartOperation:(int64_t)a3 animated:(BOOL)a4 interactive:(BOOL)a5
{
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isStatusBarHidden");

  -[PUNavigationTransition setWasStatusBarHiddenBeforeTransition:](self, "setWasStatusBarHiddenBeforeTransition:", v7);
}

- (double)pushDuration
{
  return self->_pushDuration;
}

- (double)popDuration
{
  return self->_popDuration;
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (BOOL)wasStatusBarHiddenBeforeTransition
{
  return self->_wasStatusBarHiddenBeforeTransition;
}

- (void)setWasStatusBarHiddenBeforeTransition:(BOOL)a3
{
  self->_wasStatusBarHiddenBeforeTransition = a3;
}

- (int64_t)_operation
{
  return self->__operation;
}

- (void)_setOperation:(int64_t)a3
{
  self->__operation = a3;
}

- (UIViewController)expectedDestinationOnPop
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_expectedDestinationOnPop);
}

- (void)setExpectedDestinationOnPop:(id)a3
{
  objc_storeWeak((id *)&self->_expectedDestinationOnPop, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_expectedDestinationOnPop);
  objc_destroyWeak((id *)&self->_navigationController);
}

+ (id)animationControllerForOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5 inNavigationController:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (a3 == 1)
  {
    objc_msgSend(v10, "pu_navigationTransition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "expectedDestinationOnPop");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      objc_msgSend(v12, "setExpectedDestinationOnPop:", v9);
  }
  else if (a3 == 2)
  {
    objc_msgSend(v9, "pu_navigationTransition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "expectedDestinationOnPop");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13 && (id)v13 != v10)
    {

      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v12, "setNavigationController:", v11);
  objc_msgSend(v12, "transitionWillAnimateOperation:interactive:", a3, objc_msgSend(v12, "isInteractive"));
  objc_msgSend(v12, "_setOperation:", a3);
  objc_msgSend(v11, "pu_navigationTransitionWillStart:", v12);

  return v12;
}

@end
