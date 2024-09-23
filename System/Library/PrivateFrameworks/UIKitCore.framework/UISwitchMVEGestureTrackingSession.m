@implementation UISwitchMVEGestureTrackingSession

- (void)reset
{
  UIGestureRecognizer *pendingDisplayedOnValueInitiatingGesture;
  id WeakRetained;
  id v5;

  pendingDisplayedOnValueInitiatingGesture = self->_pendingDisplayedOnValueInitiatingGesture;
  self->_pendingDisplayedOnValueInitiatingGesture = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_visualElement);
  self->_lastCommitedOnValue = objc_msgSend(WeakRetained, "displayedOn");

  v5 = objc_loadWeakRetained((id *)&self->_visualElement);
  self->_displayedOnValue = objc_msgSend(v5, "displayedOn");

  -[UISwitchMVEGestureTrackingSession _updateMovementVectorForPanInitiatedChanges](self, "_updateMovementVectorForPanInitiatedChanges");
}

- (UISwitchMVEGestureTrackingSession)initWithVisualElement:(id)a3
{
  id v4;
  UISwitchMVEGestureTrackingSession *v5;
  UISwitchMVEGestureTrackingSession *v6;
  id v7;
  int v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UISwitchMVEGestureTrackingSession;
  v5 = -[UISwitchMVEGestureTrackingSession init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_visualElement, v4);
    v8 = objc_msgSend(v4, "_shouldReverseLayoutDirection");
    v9 = 1.0;
    if (v8)
      v9 = -1.0;
    v6->_naturalLayoutDirection = v9;

    -[UISwitchMVEGestureTrackingSession reset](v6, "reset");
  }

  return v6;
}

- (void)_updateMovementVectorForPanInitiatedChanges
{
  double naturalLayoutDirection;
  double v3;
  double v4;

  naturalLayoutDirection = self->_naturalLayoutDirection;
  if (self->_displayedOnValue)
    naturalLayoutDirection = -naturalLayoutDirection;
  v3 = naturalLayoutDirection * 25.0;
  v4 = 0.0;
  if (!self->_displayedOnValue)
    v4 = 1.0;
  self->_movementVectorForPanInitiatedChangeY = v3;
  self->_movementVectorForPanInitiatedChangeTargetOnValue = v4;
}

- (void)setDisplayedOnValue:(BOOL)a3
{
  self->_displayedOnValue = a3;
  -[UISwitchMVEGestureTrackingSession _updateMovementVectorForPanInitiatedChanges](self, "_updateMovementVectorForPanInitiatedChanges");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDisplayedOnValueInitiatingGesture, 0);
  objc_destroyWeak((id *)&self->_visualElement);
}

- (void)setPendingDisplayedOnValue:(BOOL)a3 forGesture:(id)a4
{
  self->_pendingDisplayedOnValue = a3;
  objc_storeStrong((id *)&self->_pendingDisplayedOnValueInitiatingGesture, a4);
  -[UISwitchMVEGestureTrackingSession _updateMovementVectorForPanInitiatedChanges](self, "_updateMovementVectorForPanInitiatedChanges");
}

- (void)invalidatePendingOnValue
{
  -[UISwitchMVEGestureTrackingSession setPendingDisplayedOnValue:forGesture:](self, "setPendingDisplayedOnValue:forGesture:", self->_displayedOnValue, 0);
}

- (BOOL)pendingDisplayedOnValueIsValid
{
  return self->_pendingDisplayedOnValueInitiatingGesture != 0;
}

- (BOOL)updatePendingDisplayedOnValueIfMovementIsEnoughToInitiateChange:(double)a3 forGesture:(id)a4
{
  id v6;
  _BOOL4 v7;

  v6 = a4;
  v7 = -[UISwitchMVEGestureTrackingSession _isMovementDirectionAndMagnitudeEnoughToPerformOnOffChange:](self, "_isMovementDirectionAndMagnitudeEnoughToPerformOnOffChange:", a3);
  if (v7)
    -[UISwitchMVEGestureTrackingSession setPendingDisplayedOnValue:forGesture:](self, "setPendingDisplayedOnValue:forGesture:", self->_movementVectorForPanInitiatedChangeTargetOnValue != 0.0, v6);

  return v7;
}

- (BOOL)canApplyPendingOnValueForGesture:(id)a3
{
  return self->_pendingDisplayedOnValueInitiatingGesture == a3;
}

- (void)applyPendingDisplayedOnValueAndSendActions
{
  -[UISwitchMVEGestureTrackingSession _applyPendingChangesIfNecessary](self, "_applyPendingChangesIfNecessary");
  -[UISwitchMVEGestureTrackingSession _sendStateChangeActionsIfNecessary](self, "_sendStateChangeActionsIfNecessary");
}

- (void)_applyPendingChangesIfNecessary
{
  int pendingDisplayedOnValue;
  id WeakRetained;
  int v5;
  id v6;
  UIGestureRecognizer *pendingDisplayedOnValueInitiatingGesture;

  if (-[UISwitchMVEGestureTrackingSession pendingDisplayedOnValueIsValid](self, "pendingDisplayedOnValueIsValid"))
  {
    pendingDisplayedOnValue = self->_pendingDisplayedOnValue;
    WeakRetained = objc_loadWeakRetained((id *)&self->_visualElement);
    v5 = objc_msgSend(WeakRetained, "displayedOn");

    if (pendingDisplayedOnValue != v5)
    {
      v6 = objc_loadWeakRetained((id *)&self->_visualElement);
      objc_msgSend(v6, "interactiveChangeToDisplayedOn:", self->_pendingDisplayedOnValue);

    }
    pendingDisplayedOnValueInitiatingGesture = self->_pendingDisplayedOnValueInitiatingGesture;
    self->_pendingDisplayedOnValueInitiatingGesture = 0;

  }
}

- (void)_sendStateChangeActionsIfNecessary
{
  _BOOL4 displayedOnValue;
  id WeakRetained;

  displayedOnValue = self->_displayedOnValue;
  if (displayedOnValue != self->_lastCommitedOnValue)
  {
    self->_lastCommitedOnValue = displayedOnValue;
    WeakRetained = objc_loadWeakRetained((id *)&self->_visualElement);
    objc_msgSend(WeakRetained, "sendStateChangeActions");

  }
}

- (BOOL)_isMovementDirectionTrackableForPossibleOnOffChange:(double)a3
{
  return (a3 <= 0.0) ^ (self->_movementVectorForPanInitiatedChangeY > 0.0);
}

- (BOOL)_isMovementDirectionAndMagnitudeEnoughToPerformOnOffChange:(double)a3
{
  _BOOL4 v5;

  v5 = -[UISwitchMVEGestureTrackingSession _isMovementDirectionTrackableForPossibleOnOffChange:](self, "_isMovementDirectionTrackableForPossibleOnOffChange:");
  if (v5)
    LOBYTE(v5) = fabs(a3) > fabs(self->_movementVectorForPanInitiatedChangeY);
  return v5;
}

+ (BOOL)gestureIsInEndState:(int64_t)a3
{
  return a3 == 3 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (UISwitchMVEGestureTrackingSessionElement)visualElement
{
  return (UISwitchMVEGestureTrackingSessionElement *)objc_loadWeakRetained((id *)&self->_visualElement);
}

- (void)setVisualElement:(id)a3
{
  objc_storeWeak((id *)&self->_visualElement, a3);
}

- (BOOL)displayedOnValue
{
  return self->_displayedOnValue;
}

- (double)naturalLayoutDirection
{
  return self->_naturalLayoutDirection;
}

- (double)movementVectorForPanInitiatedChangeY
{
  return self->_movementVectorForPanInitiatedChangeY;
}

- (double)movementVectorForPanInitiatedChangeTargetOnValue
{
  return self->_movementVectorForPanInitiatedChangeTargetOnValue;
}

- (UIGestureRecognizer)pendingDisplayedOnValueInitiatingGesture
{
  return self->_pendingDisplayedOnValueInitiatingGesture;
}

- (BOOL)pendingDisplayedOnValue
{
  return self->_pendingDisplayedOnValue;
}

- (BOOL)lastCommitedOnValue
{
  return self->_lastCommitedOnValue;
}

@end
