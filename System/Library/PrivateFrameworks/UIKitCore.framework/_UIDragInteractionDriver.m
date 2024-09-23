@implementation _UIDragInteractionDriver

- (double)liftMoveHysteresis
{
  return self->_liftMoveHysteresis;
}

- (void)setLiftMoveHysteresis:(double)a3
{
  self->_liftMoveHysteresis = a3;
}

- (void)setLiftDelay:(double)a3
{
  self->_liftDelay = a3;
}

- (void)setCompetingLongPressDelay:(double)a3
{
  self->_competingLongPressDelay = a3;
}

- (void)setCancellationDelay:(double)a3
{
  self->_cancellationDelay = a3;
}

- (void)setView:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_view);

    if (v5)
    {
      v6 = objc_loadWeakRetained((id *)&self->_view);
      -[_UIDragInteractionDriver detachFromView:](self, "detachFromView:", v6);

    }
    v7 = objc_storeWeak((id *)&self->_view, obj);

    if (obj)
    {
      v8 = objc_loadWeakRetained((id *)&self->_view);
      -[_UIDragInteractionDriver attachToView:](self, "attachToView:", v8);

    }
  }

}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setCancellationTimerEnabled:(BOOL)a3
{
  self->_cancellationTimerEnabled = a3;
}

- (void)setAllowsSimultaneousRecognitionDuringLift:(BOOL)a3
{
  self->_allowsSimultaneousRecognitionDuringLift = a3;
}

- (void)setAdditionalTouchesCancelLift:(BOOL)a3
{
  self->_additionalTouchesCancelLift = a3;
}

- (BOOL)automaticallyAddsFailureRelationships
{
  return self->_automaticallyAddsFailureRelationships;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setShouldAnimateLift:(BOOL)a3
{
  self->_shouldAnimateLift = a3;
}

- (void)setAutomaticallyAddsFailureRelationships:(BOOL)a3
{
  self->_automaticallyAddsFailureRelationships = a3;
}

- (double)liftDelay
{
  return self->_liftDelay;
}

- (_UIDragInteractionDriver)init
{
  _UIDragInteractionDriver *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDragInteractionDriver;
  result = -[_UIDragInteractionDriver init](&v3, sel_init);
  if (result)
  {
    result->_stateMachine.state = 1;
    result->_stateMachine.eventsQueueEnd = 0;
  }
  return result;
}

- (_UIDragInteractionDriverDelegate)delegate
{
  return (_UIDragInteractionDriverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)additionalTouchesCancelLift
{
  return self->_additionalTouchesCancelLift;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemUpdater, 0);
  objc_storeStrong((id *)&self->_allowedTouchTypes, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)cancel
{
  if (self)
    _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->_stateMachine, (uint64_t)self, 5);
}

- (BOOL)isGestureRecognizerForDragInitiation:(id)a3
{
  return 0;
}

- (BOOL)isActive
{
  return self->_stateMachine.state != 1;
}

- (void)didTransitionToPreparing
{
  void *v3;
  _QWORD v4[5];

  -[_UIDragInteractionDriver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52___UIDragInteractionDriver_didTransitionToPreparing__block_invoke;
  v4[3] = &unk_1E16B3FD8;
  v4[4] = self;
  objc_msgSend(v3, "dragDriver:prepareToLiftWithCompletion:", self, v4);

}

- (void)didTransitionToInflightState
{
  void *v3;
  char v4;

  -[_UIDragInteractionDriver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dragDriverBeginLift:", self);

  if ((v4 & 1) == 0)
    -[_UIDragInteractionDriver cancel](self, "cancel");
}

- (void)didTransitionToCancelState
{
  void *v3;
  void *v4;

  -[_UIDragInteractionDriver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dragDriverCancelLift:", self);

  -[_UIDragInteractionDriver delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dragDriverCancelAddItemsGesture:", self);

  if (self)
    _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->_stateMachine, (uint64_t)self, 7);
}

- (CGPoint)initialLocationInWindow
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialLocationInWindow.x;
  y = self->_initialLocationInWindow.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialLocationInWindow:(CGPoint)a3
{
  self->_initialLocationInWindow.x = a3.x;
  self->_initialLocationInWindow.y = a3.y;
  self->_initialLocationInWindow.z = 0.0;
}

- (unint64_t)_state
{
  if (self)
    return *(_QWORD *)(self + 8);
  return self;
}

- (void)_handleEvent:(unint64_t)a3
{
  if (self)
    _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->_stateMachine, (uint64_t)self, a3);
}

- (BOOL)allowsSimultaneousRecognitionDuringLift
{
  return self->_allowsSimultaneousRecognitionDuringLift;
}

- (BOOL)shouldAnimateLift
{
  return self->_shouldAnimateLift;
}

- (BOOL)cancellationTimerEnabled
{
  return self->_cancellationTimerEnabled;
}

- (BOOL)competingLongPressOnLift
{
  return self->_competingLongPressOnLift;
}

- (void)setCompetingLongPressOnLift:(BOOL)a3
{
  self->_competingLongPressOnLift = a3;
}

- (double)cancellationDelay
{
  return self->_cancellationDelay;
}

- (double)competingLongPressDelay
{
  return self->_competingLongPressDelay;
}

- (NSArray)allowedTouchTypes
{
  return self->_allowedTouchTypes;
}

- (void)setAllowedTouchTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)itemUpdater
{
  return self->_itemUpdater;
}

@end
