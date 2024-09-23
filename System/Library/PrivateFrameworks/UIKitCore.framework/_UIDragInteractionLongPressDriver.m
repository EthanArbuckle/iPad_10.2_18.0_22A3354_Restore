@implementation _UIDragInteractionLongPressDriver

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  _UIRelationshipGestureRecognizer *v6;
  id v7;
  char v8;
  char isKindOfClass;

  v6 = (_UIRelationshipGestureRecognizer *)a3;
  v7 = a4;
  if (self->_gestureRecognizerForFailureRelationship == v6)
  {
    v8 = 1;
    goto LABEL_9;
  }
  if ((_UIRelationshipGestureRecognizer *)self->_gestureRecognizerForDragInitiation == v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
LABEL_8:
    v8 = isKindOfClass ^ 1;
    goto LABEL_9;
  }
  if (self->_gestureRecognizerForExclusionRelationship == v6)
  {
    isKindOfClass = -[_UIDragInteractionLongPressDriver canExcludeCompetingGestureRecognizer:](self, "canExcludeCompetingGestureRecognizer:", v7);
    goto LABEL_8;
  }
  v8 = 0;
LABEL_9:

  return v8 & 1;
}

- (BOOL)canExcludeCompetingGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;

  v4 = a3;
  -[_UIDragInteractionDriver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "dragDriverWantsExclusionOverride:", self))
  {
    v6 = objc_msgSend(v5, "dragDriver:canExcludeCompetingGestureRecognizer:", self, v4);

  }
  else
  {
    v7 = objc_msgSend(v4, "_isGestureType:", 1);

    v6 = v7 ^ 1;
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  char v7;
  void *v8;

  v6 = a4;
  if (self->_gestureRecognizerForDragInitiation == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      -[_UIDragInteractionDriver delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "dragDriver:competingGestureRecognizerShouldDelayLift:", self, v6);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  _UIRelationshipGestureRecognizer *v6;
  id v7;
  BOOL v8;

  v6 = (_UIRelationshipGestureRecognizer *)a3;
  v7 = a4;
  v8 = self->_gestureRecognizerForExclusionRelationship != v6
    && self->_gestureRecognizerForFailureRelationship == v6
    && -[_UIDragInteractionLongPressDriver shouldDelayCompetingGestureRecognizer:](self, "shouldDelayCompetingGestureRecognizer:", v7);

  return v8;
}

- (BOOL)shouldDelayCompetingGestureRecognizer:(id)a3
{
  id v4;
  id v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  if (qword_1ECD7B060 != -1)
    dispatch_once(&qword_1ECD7B060, &__block_literal_global_680);
  v5 = (id)qword_1ECD7B058;
  v6 = objc_msgSend(v5, "containsObject:", objc_opt_class());

  if ((v6 & 1) != 0 || !objc_msgSend(v4, "_isGestureType:", 1))
  {
    v8 = 0;
  }
  else
  {
    -[_UIDragInteractionDriver delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "dragDriver:shouldDelayCompetingGestureRecognizer:", self, v4);

  }
  return v8;
}

- (_UIDragInteractionLongPressDriver)initWithBehavior:(unint64_t)a3
{
  _UIDragInteractionLongPressDriver *v4;
  _UIDragInteractionLongPressDriver *v5;
  double v6;
  objc_class *v7;
  unint64_t behavior;
  _UIDragLiftGestureRecognizer *v9;
  _UIDragLiftGestureRecognizer *gestureRecognizerForDragInitiation;
  _UIRelationshipGestureRecognizer *v11;
  _UIRelationshipGestureRecognizer *gestureRecognizerForFailureRelationship;
  _UIRelationshipGestureRecognizer *v13;
  _UIRelationshipGestureRecognizer *gestureRecognizerForExclusionRelationship;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UIDragInteractionLongPressDriver;
  v4 = -[_UIDragInteractionDriver init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_behavior = a3;
    -[_UIDragInteractionDriver setShouldAnimateLift:](v4, "setShouldAnimateLift:", 1);
    -[_UIDragInteractionDriver setCompetingLongPressDelay:](v5, "setCompetingLongPressDelay:", _UIDragInteractionDefaultCompetingLongPressDelay());
    -[_UIDragInteractionDriver setCancellationDelay:](v5, "setCancellationDelay:", _UIDragInteractionDefaultCancellationDelay());
    if (v5->_behavior - 1 > 1)
    {
      -[_UIDragInteractionLongPressDriver setLiftMoveHysteresis:](v5, "setLiftMoveHysteresis:", _UIDragInteractionDefaultLiftMoveHysteresis());
      v6 = _UIDragInteractionDefaultLiftDelay();
    }
    else
    {
      -[_UIDragInteractionLongPressDriver setLiftMoveHysteresis:](v5, "setLiftMoveHysteresis:", _UIDragInteractionDefaultPointerLiftMoveHysteresis());
      v6 = _UIDragInteractionDefaultPointerLiftDelay();
    }
    -[_UIDragInteractionLongPressDriver setLiftDelay:](v5, "setLiftDelay:", v6);
    v7 = (objc_class *)objc_opt_class();
    behavior = v5->_behavior;
    if (behavior == 1 || behavior == 2)
      v7 = (objc_class *)objc_opt_class();
    v9 = (_UIDragLiftGestureRecognizer *)objc_msgSend([v7 alloc], "initWithTarget:action:", v5, sel_dragInitiationGestureStateChanged_);
    -[UIGestureRecognizer setName:](v9, "setName:", CFSTR("com.apple.UIKit.dragInitiation"));
    -[UIGestureRecognizer setDelegate:](v9, "setDelegate:", v5);
    -[_UIDragInteractionDriver liftDelay](v5, "liftDelay");
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v9, "setMinimumPressDuration:");
    -[UIGestureRecognizer setCancelsTouchesInView:](v9, "setCancelsTouchesInView:", 0);
    -[UILongPressGestureRecognizer setNumberOfTouchesRequired:](v9, "setNumberOfTouchesRequired:", 1);
    gestureRecognizerForDragInitiation = v5->_gestureRecognizerForDragInitiation;
    v5->_gestureRecognizerForDragInitiation = v9;

    -[_UIDragInteractionLongPressDriver _updateLiftMoveHysteresisInDragInitiationGesture](v5, "_updateLiftMoveHysteresisInDragInitiationGesture");
    v11 = (_UIRelationshipGestureRecognizer *)objc_opt_new();
    -[UIGestureRecognizer setName:](v11, "setName:", CFSTR("com.apple.UIKit.dragFailureRelationships"));
    -[UIGestureRecognizer setDelegate:](v11, "setDelegate:", v5);
    gestureRecognizerForFailureRelationship = v5->_gestureRecognizerForFailureRelationship;
    v5->_gestureRecognizerForFailureRelationship = v11;

    v13 = (_UIRelationshipGestureRecognizer *)objc_opt_new();
    -[UIGestureRecognizer setName:](v13, "setName:", CFSTR("com.apple.UIKit.dragExclusionRelationships"));
    -[UIGestureRecognizer setDelegate:](v13, "setDelegate:", v5);
    gestureRecognizerForExclusionRelationship = v5->_gestureRecognizerForExclusionRelationship;
    v5->_gestureRecognizerForExclusionRelationship = v13;

  }
  return v5;
}

- (void)setLiftMoveHysteresis:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIDragInteractionLongPressDriver;
  -[_UIDragInteractionDriver setLiftMoveHysteresis:](&v4, sel_setLiftMoveHysteresis_, a3);
  -[_UIDragInteractionLongPressDriver _updateLiftMoveHysteresisInDragInitiationGesture](self, "_updateLiftMoveHysteresisInDragInitiationGesture");
}

- (void)_updateLiftMoveHysteresisInDragInitiationGesture
{
  unint64_t behavior;
  _UIDragLiftGestureRecognizer *gestureRecognizerForDragInitiation;

  behavior = self->_behavior;
  -[_UIDragInteractionDriver liftMoveHysteresis](self, "liftMoveHysteresis");
  gestureRecognizerForDragInitiation = self->_gestureRecognizerForDragInitiation;
  if (behavior == 1)
  {
    -[_UIDragLiftGestureRecognizer setLiftMoveHysteresis:](gestureRecognizerForDragInitiation, "setLiftMoveHysteresis:");
    -[UILongPressGestureRecognizer setAllowableMovement:](self->_gestureRecognizerForDragInitiation, "setAllowableMovement:", 1.79769313e308);
    -[UIGestureRecognizer setDelaysTouchesEnded:](self->_gestureRecognizerForDragInitiation, "setDelaysTouchesEnded:", 0);
  }
  else
  {
    -[UILongPressGestureRecognizer setAllowableMovement:](gestureRecognizerForDragInitiation, "setAllowableMovement:");
  }
}

- (void)setLiftDelay:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDragInteractionLongPressDriver;
  -[_UIDragInteractionDriver setLiftDelay:](&v5, sel_setLiftDelay_);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_gestureRecognizerForDragInitiation, "setMinimumPressDuration:", a3);
}

- (void)setAutomaticallyAddsFailureRelationships:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 v6;
  _UIRelationshipGestureRecognizer *gestureRecognizerForFailureRelationship;
  objc_super v8;

  v3 = a3;
  if (-[_UIDragInteractionDriver automaticallyAddsFailureRelationships](self, "automaticallyAddsFailureRelationships") != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIDragInteractionLongPressDriver;
    -[_UIDragInteractionDriver setAutomaticallyAddsFailureRelationships:](&v8, sel_setAutomaticallyAddsFailureRelationships_, v3);
    -[_UIDragInteractionDriver view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[_UIDragInteractionDriver automaticallyAddsFailureRelationships](self, "automaticallyAddsFailureRelationships");
      gestureRecognizerForFailureRelationship = self->_gestureRecognizerForFailureRelationship;
      if (v6)
        objc_msgSend(v5, "addGestureRecognizer:", gestureRecognizerForFailureRelationship);
      else
        objc_msgSend(v5, "removeGestureRecognizer:", gestureRecognizerForFailureRelationship);
    }

  }
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (void)attachToView:(id)a3
{
  _UIDragLiftGestureRecognizer *gestureRecognizerForDragInitiation;
  id v5;

  gestureRecognizerForDragInitiation = self->_gestureRecognizerForDragInitiation;
  v5 = a3;
  objc_msgSend(v5, "addGestureRecognizer:", gestureRecognizerForDragInitiation);
  objc_msgSend(v5, "addGestureRecognizer:", self->_gestureRecognizerForExclusionRelationship);
  objc_msgSend(v5, "addGestureRecognizer:", self->_gestureRecognizerForFailureRelationship);

}

- (void)detachFromView:(id)a3
{
  _UIDragLiftGestureRecognizer *gestureRecognizerForDragInitiation;
  id v5;

  gestureRecognizerForDragInitiation = self->_gestureRecognizerForDragInitiation;
  v5 = a3;
  objc_msgSend(v5, "removeGestureRecognizer:", gestureRecognizerForDragInitiation);
  objc_msgSend(v5, "removeGestureRecognizer:", self->_gestureRecognizerForExclusionRelationship);
  objc_msgSend(v5, "removeGestureRecognizer:", self->_gestureRecognizerForFailureRelationship);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  _UIDragLiftGestureRecognizer *v6;
  id v7;
  void *v8;
  int v9;
  unint64_t behavior;
  BOOL v11;
  void *v13;
  uint64_t v14;

  v6 = (_UIDragLiftGestureRecognizer *)a3;
  v7 = a4;
  if (!-[_UIDragInteractionDriver isEnabled](self, "isEnabled"))
    goto LABEL_8;
  -[_UIDragInteractionDriver delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "dragDriver:shouldReceiveTouch:", self, v7);

  if (!v9)
    goto LABEL_8;
  behavior = self->_behavior;
  if (behavior - 1 >= 2)
  {
    if (behavior || (objc_msgSend(v7, "_originatesFromPointerEvent") & 1) == 0)
      goto LABEL_10;
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v7, "_originatesFromPointerEvent") & 1) == 0)
    goto LABEL_8;
LABEL_10:
  if (-[_UIDragInteractionDriver additionalTouchesCancelLift](self, "additionalTouchesCancelLift"))
  {
    -[UIGestureRecognizer _allActiveTouches](self->_gestureRecognizerForDragInitiation, "_allActiveTouches");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 >= 1 && self->_gestureRecognizerForDragInitiation == v6 && self->super._stateMachine.state != 5)
      -[_UIDragInteractionDriver cancel](self, "cancel");
  }
  v11 = 1;
LABEL_9:

  return v11;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  _UIRelationshipGestureRecognizer *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = (_UIRelationshipGestureRecognizer *)a3;
  if (-[UIGestureRecognizer state](self->_gestureRecognizerForDragInitiation, "state") == UIGestureRecognizerStateFailed
    || -[UIGestureRecognizer state](self->_gestureRecognizerForDragInitiation, "state") == UIGestureRecognizerStateCancelled)
  {
    -[_UIDragInteractionLongPressDriver openCompetingGestureRecognizerGateCancelingGestures:](self, "openCompetingGestureRecognizerGateCancelingGestures:", 0);
  }
  else if (self->_gestureRecognizerForExclusionRelationship == v4)
  {
    if (self->super._stateMachine.state == 1)
    {
      -[_UIDragInteractionLongPressDriver invalidateCompetingGestureRecognizerGateTimer](self, "invalidateCompetingGestureRecognizerGateTimer");
      -[_UIDragInteractionLongPressDriver invalidateCancellationTimer](self, "invalidateCancellationTimer");
      v6[0] = self->_gestureRecognizerForDragInitiation;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDragInteractionLongPressDriver openCompetingGestureRecognizerGateCancelingGestures:](self, "openCompetingGestureRecognizerGateCancelingGestures:", v5);

    }
    -[_UIDragInteractionDriver cancel](self, "cancel");
  }

}

- (void)openCompetingGestureRecognizerGateCancelingGestures:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  if (a3)
  {
    v4 = (void *)UIApp;
    v5 = a3;
    objc_msgSend(v4, "_gestureEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureEnvironment _cancelGestureRecognizers:]((uint64_t)v6, v5);

  }
  -[_UIRelationshipGestureRecognizer _fail](self->_gestureRecognizerForFailureRelationship, "_fail");
}

- (_UIDragInteractionLongPressDriver)init
{
  return -[_UIDragInteractionLongPressDriver initWithBehavior:](self, "initWithBehavior:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizerForExclusionRelationship, 0);
  objc_storeStrong((id *)&self->_gestureRecognizerForFailureRelationship, 0);
  objc_storeStrong((id *)&self->_gestureRecognizerForDragInitiation, 0);
  objc_storeStrong((id *)&self->_cancellationTimer, 0);
  objc_storeStrong((id *)&self->_gateTimer, 0);
}

- (void)reset
{
  -[_UIDragInteractionLongPressDriver invalidateCompetingGestureRecognizerGateTimer](self, "invalidateCompetingGestureRecognizerGateTimer");
  -[_UIDragInteractionLongPressDriver invalidateCancellationTimer](self, "invalidateCancellationTimer");
  -[_UIDragInteractionDriver setInitialLocationInWindow:](self, "setInitialLocationInWindow:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)didTransitionToPreparing
{
  objc_super v3;

  -[_UIDragInteractionLongPressDriver _gateCompetingGestureRecognizers](self, "_gateCompetingGestureRecognizers");
  v3.receiver = self;
  v3.super_class = (Class)_UIDragInteractionLongPressDriver;
  -[_UIDragInteractionDriver didTransitionToPreparing](&v3, sel_didTransitionToPreparing);
}

- (void)didTransitionToDeferred
{
  objc_super v3;

  if (dyld_program_sdk_at_least())
    -[_UIDragInteractionLongPressDriver _gateCompetingGestureRecognizers](self, "_gateCompetingGestureRecognizers");
  v3.receiver = self;
  v3.super_class = (Class)_UIDragInteractionLongPressDriver;
  -[_UIDragInteractionDriver didTransitionToDeferred](&v3, sel_didTransitionToDeferred);
}

- (void)didTransitionToInflightState
{
  void *v3;
  char v4;

  -[_UIDragInteractionDriver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dragDriverBeginLift:", self);

  if ((v4 & 1) != 0)
  {
    if (!-[_UIDragInteractionDriver allowsSimultaneousRecognitionDuringLift](self, "allowsSimultaneousRecognitionDuringLift"))-[_UIRelationshipGestureRecognizer _succeed](self->_gestureRecognizerForExclusionRelationship, "_succeed");
  }
  else
  {
    -[_UIDragInteractionDriver cancel](self, "cancel");
  }
}

- (void)didTransitionToCancelState
{
  void *v3;
  objc_super v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[_UIDragInteractionLongPressDriver invalidateCompetingGestureRecognizerGateTimer](self, "invalidateCompetingGestureRecognizerGateTimer");
  -[_UIDragInteractionLongPressDriver invalidateCancellationTimer](self, "invalidateCancellationTimer");
  v5[0] = self->_gestureRecognizerForDragInitiation;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDragInteractionLongPressDriver openCompetingGestureRecognizerGateCancelingGestures:](self, "openCompetingGestureRecognizerGateCancelingGestures:", v3);

  v4.receiver = self;
  v4.super_class = (Class)_UIDragInteractionLongPressDriver;
  -[_UIDragInteractionDriver didTransitionToCancelState](&v4, sel_didTransitionToCancelState);
}

- (void)didTransitionToBeginState
{
  _UIDragLiftGestureRecognizer *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  uint8_t v29[128];
  uint8_t buf[4];
  _UIDragInteractionLongPressDriver *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  _UIDragLiftGestureRecognizer *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)_UIDragInteractionLongPressDriver;
  -[_UIDragInteractionDriver didTransitionToBeginState](&v28, sel_didTransitionToBeginState);
  if (-[_UIDragInteractionDriver allowsSimultaneousRecognitionDuringLift](self, "allowsSimultaneousRecognitionDuringLift"))
  {
    -[_UIRelationshipGestureRecognizer _succeed](self->_gestureRecognizerForExclusionRelationship, "_succeed");
  }
  -[_UIDragInteractionLongPressDriver invalidateCompetingGestureRecognizerGateTimer](self, "invalidateCompetingGestureRecognizerGateTimer");
  -[_UIDragInteractionLongPressDriver invalidateCancellationTimer](self, "invalidateCancellationTimer");
  v4 = self->_gestureRecognizerForDragInitiation;
  -[UIGestureRecognizer _allActiveTouches](v4, "_allActiveTouches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    v11 = _MergedGlobals_11_17;
    if (!_MergedGlobals_11_17)
    {
      v11 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&_MergedGlobals_11_17);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v8 = v12;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v31 = self;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v4;
    v10 = "%@ %@ gesture recognizer %@ has no touches that are not ended or cancelled, so it cannot be used to start a drag";
    goto LABEL_13;
  }
  if ((unint64_t)objc_msgSend(v5, "count") >= 3)
  {
    v6 = qword_1ECD7B050;
    if (!qword_1ECD7B050)
    {
      v6 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&qword_1ECD7B050);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v31 = self;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v4;
    v10 = "%@ %@ gesture recognizer %@ has more than 2 touches that are not ended or cancelled, so it cannot be used to start a drag";
LABEL_13:
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x20u);

LABEL_14:
    -[_UIDragInteractionDriver cancel](self, "cancel");
    goto LABEL_23;
  }
  v13 = (void *)UIApp;
  -[_UIDragInteractionDriver view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_touchesEventForWindow:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = v5;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        -[UIGestureRecognizer _removeTouch:forEvent:](v4, "_removeTouch:forEvent:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), v16, (_QWORD)v24);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

  -[_UIDragInteractionDriver delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDragInteractionDriver itemUpdater](self, "itemUpdater");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dragDriver:beginDragWithTouches:itemUpdater:beginningSessionHandler:", self, v17, v23, 0);

LABEL_23:
}

- (void)didTransitionToInactiveState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDragInteractionLongPressDriver;
  -[_UIDragInteractionDriver didTransitionToInactiveState](&v3, sel_didTransitionToInactiveState);
  -[_UIDragInteractionLongPressDriver reset](self, "reset");
}

- (void)setAllowedTouchTypes:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDragInteractionLongPressDriver;
  v4 = a3;
  -[_UIDragInteractionDriver setAllowedTouchTypes:](&v5, sel_setAllowedTouchTypes_, v4);
  -[UIGestureRecognizer setAllowedTouchTypes:](self->_gestureRecognizerForDragInitiation, "setAllowedTouchTypes:", v4, v5.receiver, v5.super_class);

}

- (BOOL)isGestureRecognizerForDragInitiation:(id)a3
{
  return self->_gestureRecognizerForDragInitiation == a3;
}

- (BOOL)_wantsTimeDelayedFailureRequirementGate
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[_UIDragInteractionDriver view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (v5 == 1)
    return 0;
  else
    return !-[_UIDragInteractionDriver competingLongPressOnLift](self, "competingLongPressOnLift");
}

- (void)_gateCompetingGestureRecognizers
{
  _BOOL4 v3;
  UIDelayedAction *gateTimer;
  UIDelayedAction *v5;
  UIDelayedAction *v6;
  UIDelayedAction *v7;
  _BOOL4 v8;
  UIDelayedAction *cancellationTimer;
  UIDelayedAction *v10;
  UIDelayedAction *v11;
  UIDelayedAction *v12;

  v3 = -[_UIDragInteractionLongPressDriver _wantsTimeDelayedFailureRequirementGate](self, "_wantsTimeDelayedFailureRequirementGate");
  gateTimer = self->_gateTimer;
  if (v3)
  {
    if (gateTimer)
    {
      -[UIDelayedAction touch](gateTimer, "touch");
    }
    else
    {
      v5 = [UIDelayedAction alloc];
      -[_UIDragInteractionDriver competingLongPressDelay](self, "competingLongPressDelay");
      v6 = -[UIDelayedAction initWithTarget:action:userInfo:delay:](v5, "initWithTarget:action:userInfo:delay:", self, sel_openGateCancelingAddItemsGestures, 0);
      v7 = self->_gateTimer;
      self->_gateTimer = v6;

    }
  }
  else if (gateTimer)
  {
    -[_UIDragInteractionLongPressDriver invalidateCompetingGestureRecognizerGateTimer](self, "invalidateCompetingGestureRecognizerGateTimer");
  }
  v8 = -[_UIDragInteractionDriver cancellationTimerEnabled](self, "cancellationTimerEnabled");
  cancellationTimer = self->_cancellationTimer;
  if (v8)
  {
    if (cancellationTimer)
    {
      -[UIDelayedAction touch](cancellationTimer, "touch");
    }
    else
    {
      v10 = [UIDelayedAction alloc];
      -[_UIDragInteractionDriver cancellationDelay](self, "cancellationDelay");
      v11 = -[UIDelayedAction initWithTarget:action:userInfo:delay:](v10, "initWithTarget:action:userInfo:delay:", self, sel_cancel, 0);
      v12 = self->_cancellationTimer;
      self->_cancellationTimer = v11;

    }
  }
  else if (cancellationTimer)
  {
    -[_UIDragInteractionLongPressDriver invalidateCancellationTimer](self, "invalidateCancellationTimer");
  }
}

- (void)invalidateCompetingGestureRecognizerGateTimer
{
  UIDelayedAction *gateTimer;

  -[UIDelayedAction cancel](self->_gateTimer, "cancel");
  gateTimer = self->_gateTimer;
  self->_gateTimer = 0;

}

- (void)invalidateCancellationTimer
{
  UIDelayedAction *cancellationTimer;

  -[UIDelayedAction cancel](self->_cancellationTimer, "cancel");
  cancellationTimer = self->_cancellationTimer;
  self->_cancellationTimer = 0;

}

- (void)openGateCancelingAddItemsGestures
{
  id v3;

  -[_UIDragInteractionLongPressDriver openCompetingGestureRecognizerGateCancelingGestures:](self, "openCompetingGestureRecognizerGateCancelingGestures:", 0);
  -[_UIDragInteractionDriver delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dragDriverCancelAddItemsGesture:", self);

}

- (void)dragInitiationGestureStateChanged:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIDragInteractionLongPressDriver gestureRecognizerForDragInitiation](self, "gestureRecognizerForDragInitiation");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UIDragInteractionLongPressDriver _dragInitiationGestureStateChanged:](self, "_dragInitiationGestureStateChanged:", v4);
  }
  else
  {
    v6 = dragInitiationGestureStateChanged____s_category;
    if (!dragInitiationGestureStateChanged____s_category)
    {
      v6 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&dragInitiationGestureStateChanged____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Invalid gesture recognizer sent to drag interaction %@", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)_dragInitiationGestureStateChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  _UIDragInteractionDriverStateMachine *p_stateMachine;
  _UIDragInteractionLongPressDriver *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = objc_msgSend(v17, "state");
  if (v4 == 3)
  {
    if (self)
    {
      p_stateMachine = &self->super._stateMachine;
      v13 = self;
      v14 = 4;
      goto LABEL_16;
    }
  }
  else
  {
    if (v4 == 2)
    {
      if (!self)
      {
        objc_msgSend(0, "hasMoveHysteresisBeenReached");
        goto LABEL_17;
      }
    }
    else
    {
      if (v4 != 1)
      {
        -[_UIDragInteractionDriver cancel](self, "cancel");
        goto LABEL_17;
      }
      if (self->_behavior != 1)
      {
        -[_UIDragInteractionDriver view](self, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "locationInView:", v16);
        -[_UIDragInteractionDriver setInitialLocationInWindow:](self, "setInitialLocationInWindow:");

        p_stateMachine = &self->super._stateMachine;
        v13 = self;
        v14 = 0;
        goto LABEL_16;
      }
      objc_msgSend(v17, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "startPoint");
      v7 = v6;
      v9 = v8;
      -[_UIDragInteractionDriver view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "convertPoint:toView:", v11, v7, v9);
      -[_UIDragInteractionDriver setInitialLocationInWindow:](self, "setInitialLocationInWindow:");

      _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->super._stateMachine, (uint64_t)self, 0);
    }
    if (self->super._stateMachine.state == 3
      && -[_UIDragInteractionLongPressDriver hasExceededAllowableMovement](self, "hasExceededAllowableMovement"))
    {
      p_stateMachine = &self->super._stateMachine;
      v13 = self;
      v14 = 2;
LABEL_16:
      _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)p_stateMachine, (uint64_t)v13, v14);
      goto LABEL_17;
    }
    if (-[_UIDragInteractionLongPressDriver hasMoveHysteresisBeenReached](self, "hasMoveHysteresisBeenReached"))
    {
      p_stateMachine = &self->super._stateMachine;
      v13 = self;
      v14 = 3;
      goto LABEL_16;
    }
  }
LABEL_17:

}

- (double)translationInWindow
{
  double v3;
  double v4;
  double v5;
  double v6;
  _UIDragLiftGestureRecognizer *gestureRecognizerForDragInitiation;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  -[_UIDragInteractionDriver initialLocationInWindow](self, "initialLocationInWindow");
  v4 = v3;
  v6 = v5;
  gestureRecognizerForDragInitiation = self->_gestureRecognizerForDragInitiation;
  -[_UIDragInteractionDriver view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILongPressGestureRecognizer locationInView:](gestureRecognizerForDragInitiation, "locationInView:", v9);
  v12 = sqrt((v4 - v10) * (v4 - v10) + (v6 - v11) * (v6 - v11));

  return v12;
}

- (BOOL)hasMoveHysteresisBeenReached
{
  double v3;
  double v4;
  double v5;

  -[_UIDragInteractionLongPressDriver translationInWindow](self, "translationInWindow");
  v4 = v3;
  -[_UIDragInteractionDriver liftMoveHysteresis](self, "liftMoveHysteresis");
  return v4 > v5;
}

- (BOOL)hasExceededAllowableMovement
{
  double v3;
  double v4;
  double v5;

  -[_UIDragInteractionLongPressDriver translationInWindow](self, "translationInWindow");
  v4 = v3;
  -[UILongPressGestureRecognizer allowableMovement](self->_gestureRecognizerForDragInitiation, "allowableMovement");
  return v4 > v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  _UIRelationshipGestureRecognizer *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  char v11;

  v4 = (_UIRelationshipGestureRecognizer *)a3;
  if ((_UIRelationshipGestureRecognizer *)self->_gestureRecognizerForDragInitiation == v4
    && -[UIGestureRecognizer state](self->_gestureRecognizerForExclusionRelationship, "state") <= UIGestureRecognizerStateChanged)
  {
    -[_UIDragInteractionDriver view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureRecognizer locationInView:](v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    -[_UIDragInteractionDriver delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "dragDriver:shouldBeginAtLocation:", self, v7, v9);

  }
  else
  {
    v11 = self->_gestureRecognizerForExclusionRelationship == v4;
  }

  return v11;
}

- (_UIDragLiftGestureRecognizer)gestureRecognizerForDragInitiation
{
  return self->_gestureRecognizerForDragInitiation;
}

- (_UIRelationshipGestureRecognizer)gestureRecognizerForFailureRelationship
{
  return self->_gestureRecognizerForFailureRelationship;
}

- (_UIRelationshipGestureRecognizer)gestureRecognizerForExclusionRelationship
{
  return self->_gestureRecognizerForExclusionRelationship;
}

@end
