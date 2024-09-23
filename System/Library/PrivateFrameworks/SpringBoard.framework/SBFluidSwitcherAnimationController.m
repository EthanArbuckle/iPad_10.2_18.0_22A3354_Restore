@implementation SBFluidSwitcherAnimationController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationCompletion, 0);
}

- (SBFluidSwitcherAnimationController)initWithWorkspaceTransitionRequest:(id)a3 animationSettings:(id)a4 animationBlock:(id)a5
{
  SBFluidSwitcherAnimationController *v5;
  SBFluidSwitcherAnimationController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherAnimationController;
  v5 = -[SBUIBlockAnimationController initWithWorkspaceTransitionRequest:animationSettings:animationBlock:](&v8, sel_initWithWorkspaceTransitionRequest_animationSettings_animationBlock_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[SBUIAnimationController addObserver:](v5, "addObserver:", v5);
  return v6;
}

- (void)animationControllerDidFinishAnimation:(id)a3
{
  SBFluidSwitcherAnimationController *v4;
  void (**animationCompletion)(id, uint64_t);
  id v6;
  SBFluidSwitcherAnimationController *v7;

  v4 = (SBFluidSwitcherAnimationController *)a3;
  if (v4 == self)
  {
    animationCompletion = (void (**)(id, uint64_t))v4->_animationCompletion;
    if (animationCompletion)
    {
      v7 = v4;
      animationCompletion[2](animationCompletion, -[SBFluidSwitcherAnimationController isInterrupted](v4, "isInterrupted"));
      v6 = v7->_animationCompletion;
      v7->_animationCompletion = 0;

      v4 = v7;
    }
  }

}

- (BOOL)isFluidSwitcherAnimationController
{
  return 1;
}

- (id)animationCompletion
{
  return self->_animationCompletion;
}

- (void)setAnimationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

@end
