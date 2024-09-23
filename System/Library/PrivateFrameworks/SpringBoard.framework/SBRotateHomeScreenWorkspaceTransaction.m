@implementation SBRotateHomeScreenWorkspaceTransaction

- (void)begin
{
  SBDismissOverlaysAnimationController *v3;
  void *v4;
  SBDismissOverlaysAnimationController *v5;
  SBDismissOverlaysAnimationController *animationController;
  objc_super v7;

  v3 = [SBDismissOverlaysAnimationController alloc];
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBDismissOverlaysAnimationController initWithTransitionContextProvider:options:](v3, "initWithTransitionContextProvider:options:", v4, -109);
  animationController = self->_animationController;
  self->_animationController = v5;

  -[SBUIAnimationController addObserver:](self->_animationController, "addObserver:", self);
  -[SBRotateHomeScreenWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_animationController);
  v7.receiver = self;
  v7.super_class = (Class)SBRotateHomeScreenWorkspaceTransaction;
  -[SBRotateHomeScreenWorkspaceTransaction begin](&v7, sel_begin);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
}

@end
