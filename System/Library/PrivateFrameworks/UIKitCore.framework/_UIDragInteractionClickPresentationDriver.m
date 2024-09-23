@implementation _UIDragInteractionClickPresentationDriver

- (void)cancel
{
  UIDelayedAction *delayedLift;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDragInteractionClickPresentationDriver;
  -[_UIDragInteractionDriver cancel](&v4, sel_cancel);
  -[UIDelayedAction cancel](self->_delayedLift, "cancel");
  delayedLift = self->_delayedLift;
  self->_delayedLift = 0;

}

- (BOOL)canBeginLiftAtLocation:(CGPoint)a3
{
  double y;
  double x;
  _BOOL4 v6;
  void *v7;
  char v8;

  y = a3.y;
  x = a3.x;
  v6 = -[_UIDragInteractionDriver isEnabled](self, "isEnabled");
  if (v6)
  {
    -[_UIDragInteractionDriver delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "dragDriver:shouldBeginAtLocation:", self, x, y);

    LOBYTE(v6) = v8;
  }
  return v6;
}

- (BOOL)isPreparingToDrag
{
  return self && self->super._stateMachine.state - 3 < 2 || self->_delayedLift != 0;
}

- (BOOL)isLifted
{
  if (self)
    LOBYTE(self) = self->super._stateMachine.state == 4;
  return (char)self;
}

- (void)beginLiftAtLocation:(CGPoint)a3 useDefaultLiftAnimation:(BOOL)a4 delay:(double)a5 completion:(id)a6
{
  _BOOL8 v7;
  double y;
  double x;
  id v11;
  void *v12;
  id liftCompletion;
  UIDelayedAction *v14;
  UIDelayedAction *delayedLift;

  v7 = a4;
  y = a3.y;
  x = a3.x;
  v11 = a6;
  -[_UIDragInteractionDriver setShouldAnimateLift:](self, "setShouldAnimateLift:", v7);
  -[_UIDragInteractionDriver setInitialLocationInWindow:](self, "setInitialLocationInWindow:", x, y);
  v12 = _Block_copy(v11);

  liftCompletion = self->_liftCompletion;
  self->_liftCompletion = v12;

  if (a5 <= 0.0)
  {
    _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->super._stateMachine, (uint64_t)self, 0);
  }
  else
  {
    v14 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel__performDelayedLift, 0, a5);
    delayedLift = self->_delayedLift;
    self->_delayedLift = v14;

  }
}

- (void)beginDragWithTouches:(id)a3 itemIterator:(id)a4 beginningSessionHandler:(id)a5
{
  NSSet *v9;
  id v10;
  NSSet *touches;
  NSSet *v12;
  void *v13;
  id itemIterator;
  void *v15;
  id sessionHandler;
  void *v17;
  id aBlock;

  v9 = (NSSet *)a3;
  aBlock = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDragInteractionClickPresentationDriver.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("touches"), aBlock);

  }
  touches = self->_touches;
  self->_touches = v9;
  v12 = v9;

  v13 = _Block_copy(aBlock);
  itemIterator = self->_itemIterator;
  self->_itemIterator = v13;

  v15 = _Block_copy(v10);
  sessionHandler = self->_sessionHandler;
  self->_sessionHandler = v15;

  _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->super._stateMachine, (uint64_t)self, 3);
}

- (void)_performDelayedLift
{
  UIDelayedAction *delayedLift;

  delayedLift = self->_delayedLift;
  self->_delayedLift = 0;

  _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->super._stateMachine, (uint64_t)self, 0);
}

- (void)didTransitionToBeginState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDragInteractionClickPresentationDriver;
  -[_UIDragInteractionDriver didTransitionToBeginState](&v7, sel_didTransitionToBeginState);
  -[_UIDragInteractionDriver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dragDriver:beginDragWithTouches:itemUpdater:beginningSessionHandler:", self, self->_touches, self->_itemIterator, self->_sessionHandler);

  -[NSSet anyObject](self->_touches, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend((id)UIApp, "_cancelAllEventsOfType:onEventRoutingScene:", 0, v6);
  _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->super._stateMachine, (uint64_t)self, 4);

}

- (void)didTransitionToInactiveState
{
  NSSet *touches;
  id itemIterator;
  id sessionHandler;
  id liftCompletion;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDragInteractionClickPresentationDriver;
  -[_UIDragInteractionDriver didTransitionToInactiveState](&v7, sel_didTransitionToInactiveState);
  touches = self->_touches;
  self->_touches = 0;

  itemIterator = self->_itemIterator;
  self->_itemIterator = 0;

  sessionHandler = self->_sessionHandler;
  self->_sessionHandler = 0;

  liftCompletion = self->_liftCompletion;
  self->_liftCompletion = 0;

}

- (void)didTransitionToInflightState
{
  void *v3;
  uint64_t v4;
  void (**liftCompletion)(id, uint64_t);
  id v6;

  -[_UIDragInteractionDriver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dragDriverBeginLift:", self);

  if ((v4 & 1) == 0)
    -[_UIDragInteractionClickPresentationDriver cancel](self, "cancel");
  liftCompletion = (void (**)(id, uint64_t))self->_liftCompletion;
  if (liftCompletion)
  {
    liftCompletion[2](liftCompletion, v4);
    v6 = self->_liftCompletion;
    self->_liftCompletion = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedLift, 0);
  objc_storeStrong(&self->_liftCompletion, 0);
  objc_storeStrong(&self->_sessionHandler, 0);
  objc_storeStrong(&self->_itemIterator, 0);
  objc_storeStrong((id *)&self->_touches, 0);
}

@end
