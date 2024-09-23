@implementation SBContinuousExposeStripRevealGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 10;
}

- (void)handleTransitionRequestForGestureComplete:(id)a3 fromGestureManager:(id)a4
{
  objc_super v4;

  self->_completedGestureWithTransitionRequest = 1;
  v4.receiver = self;
  v4.super_class = (Class)SBContinuousExposeStripRevealGestureWorkspaceTransaction;
  -[SBFluidSwitcherGestureWorkspaceTransaction handleTransitionRequestForGestureComplete:fromGestureManager:](&v4, sel_handleTransitionRequestForGestureComplete_fromGestureManager_, a3, a4);
}

- (BOOL)_canBeInterrupted
{
  objc_super v3;

  if (!self->_completedGestureWithTransitionRequest)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)SBContinuousExposeStripRevealGestureWorkspaceTransaction;
  return -[SBFluidSwitcherGestureWorkspaceTransaction _canBeInterrupted](&v3, sel__canBeInterrupted);
}

@end
