@implementation SBWaitForSceneLayoutTransitionTransaction

- (SBWaitForSceneLayoutTransitionTransaction)initWithSceneLayoutTransitionCoordinator:(id)a3
{
  id v5;
  SBWaitForSceneLayoutTransitionTransaction *v6;
  SBWaitForSceneLayoutTransitionTransaction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBWaitForSceneLayoutTransitionTransaction;
  v6 = -[SBTransaction init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transitionCoordinator, a3);
    -[SBLayoutStateTransitionCoordinator addObserver:](v7->_transitionCoordinator, "addObserver:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SBLayoutStateTransitionCoordinator removeObserver:](self->_transitionCoordinator, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBWaitForSceneLayoutTransitionTransaction;
  -[SBWaitForSceneLayoutTransitionTransaction dealloc](&v3, sel_dealloc);
}

- (void)_begin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBWaitForSceneLayoutTransitionTransaction;
  -[SBWaitForSceneLayoutTransitionTransaction _begin](&v3, sel__begin);
  if (!-[SBLayoutStateTransitionCoordinator isTransitioning](self->_transitionCoordinator, "isTransitioning"))
    -[SBWaitForSceneLayoutTransitionTransaction addMilestone:](self, "addMilestone:", CFSTR("SBWaitForSceneLayoutTransitionToBeginMilestone"));
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  -[SBWaitForSceneLayoutTransitionTransaction satisfyMilestone:](self, "satisfyMilestone:", CFSTR("SBWaitForSceneLayoutTransitionToBeginMilestone"), a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
}

@end
