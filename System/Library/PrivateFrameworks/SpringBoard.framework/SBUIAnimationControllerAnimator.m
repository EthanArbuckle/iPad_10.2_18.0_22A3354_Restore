@implementation SBUIAnimationControllerAnimator

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animationController);
}

- (SBUIAnimationControllerAnimator)initWithAnimationController:(id)a3
{
  id v4;
  SBUIAnimationControllerAnimator *v5;
  SBUIAnimationControllerAnimator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIAnimationControllerAnimator;
  v5 = -[SBUIAnimationControllerAnimator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_animationController, v4);

  return v6;
}

- (id)transitionAnimationFactory:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D01908];
  -[SBUIAnimationControllerAnimator animationController](self, "animationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "factoryWithSettings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)animateTransition:(id)a3
{
  id v3;

  -[SBUIAnimationControllerAnimator animationController](self, "animationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_startAnimation");

}

- (SBUIAnimationController)animationController
{
  return (SBUIAnimationController *)objc_loadWeakRetained((id *)&self->_animationController);
}

- (SBUIAnimationControllerAnimator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIAnimationControllerAnimator.m"), 18, CFSTR("use the designated initializer"));

  return -[SBUIAnimationControllerAnimator initWithAnimationController:](self, "initWithAnimationController:", 0);
}

- (double)transitionDuration:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[SBUIAnimationControllerAnimator animationController](self, "animationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  v6 = v5;

  return v6;
}

@end
