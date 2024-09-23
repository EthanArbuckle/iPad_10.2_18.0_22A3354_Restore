@implementation _UITapTapHoldGestureRecognizer

- (_UITapTapHoldGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITapTapHoldGestureRecognizer;
  return -[UITapGestureRecognizer initWithTarget:action:](&v5, sel_initWithTarget_action_, a3, a4);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITapTapHoldGestureRecognizer;
  -[UIGestureRecognizer reset](&v3, sel_reset);
  -[_UITapTapHoldGestureRecognizer cancelPendingHoldToAction](self, "cancelPendingHoldToAction");
  -[_UITapTapHoldGestureRecognizer cancelPendingTooSlowForDoubleTap](self, "cancelPendingTooSlowForDoubleTap");
  self->_gestureType = 0;
  self->_startTime = 0.0;
  self->_pressEventBeginTimestamp = 0.0;
  self->_isInHoldToAction = 0;
  self->_currentNumberOfPresses = 0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  CFTimeInterval v5;
  int v6;

  if (-[_UITapTapHoldGestureRecognizer _shouldFailInResponseToPresses:withEvent:](self, "_shouldFailInResponseToPresses:withEvent:", a3, a4))
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
  else
  {
    v5 = CACurrentMediaTime();
    self->_pressEventBeginTimestamp = v5;
    if (self->_startTime == 0.0)
      self->_startTime = v5;
    v6 = self->_currentNumberOfPresses + 1;
    self->_currentNumberOfPresses = v6;
    if (v6 == 2)
    {
      -[_UITapTapHoldGestureRecognizer cancelPendingTooSlowForDoubleTap](self, "cancelPendingTooSlowForDoubleTap");
      -[_UITapTapHoldGestureRecognizer scheduleHoldToAction](self, "scheduleHoldToAction");
    }
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  double v5;
  double v6;
  _UITapTapHoldGestureRecognizer *v7;
  uint64_t v8;
  int currentNumberOfPresses;
  double pressEventBeginTimestamp;
  double v11;
  uint64_t v12;

  v5 = CACurrentMediaTime();
  v6 = v5;
  if (!self->_isInHoldToAction && v5 - self->_pressEventBeginTimestamp > 0.75)
  {
    v7 = self;
    v8 = 5;
LABEL_13:
    -[UIGestureRecognizer setState:](v7, "setState:", v8);
    return;
  }
  currentNumberOfPresses = self->_currentNumberOfPresses;
  if (currentNumberOfPresses == 2)
  {
    pressEventBeginTimestamp = self->_pressEventBeginTimestamp;
    if (-[_UITapTapHoldGestureRecognizer isInHoldToAction](self, "isInHoldToAction")
      && (v11 = v6 - pressEventBeginTimestamp, v6 - pressEventBeginTimestamp > 0.5))
    {
      v12 = 4;
    }
    else
    {
      -[_UITapTapHoldGestureRecognizer cancelPendingHoldToAction](self, "cancelPendingHoldToAction", v11);
      v12 = 2;
    }
    -[_UITapTapHoldGestureRecognizer setGestureType:](self, "setGestureType:", v12, v11);
    v7 = self;
    v8 = 3;
    goto LABEL_13;
  }
  if (currentNumberOfPresses == 1)
    -[_UITapTapHoldGestureRecognizer scheduleTooSlowForDoubleTap](self, "scheduleTooSlowForDoubleTap");
}

- (void)tooSlowForDoubleTap:(id)a3
{
  self->_isWaitingForTooSlowForDoubleTap = 0;
  -[_UITapTapHoldGestureRecognizer setGestureType:](self, "setGestureType:", 1);
  -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)scheduleTooSlowForDoubleTap
{
  self->_isWaitingForTooSlowForDoubleTap = 1;
  -[_UITapTapHoldGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_tooSlowForDoubleTap_, 0, 0.175);
}

- (void)cancelPendingTooSlowForDoubleTap
{
  if (self->_isWaitingForTooSlowForDoubleTap)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_tooSlowForDoubleTap_, 0);
    self->_isWaitingForTooSlowForDoubleTap = 0;
  }
}

- (void)holdToAction:(id)a3
{
  self->_isWaitingForHoldToAction = 0;
  if (-[UIGestureRecognizer state](self, "state", a3) != UIGestureRecognizerStateEnded
    && -[UIGestureRecognizer state](self, "state") != UIGestureRecognizerStateCancelled)
  {
    -[_UITapTapHoldGestureRecognizer setGestureType:](self, "setGestureType:", 3);
    -[_UITapTapHoldGestureRecognizer setIsInHoldToAction:](self, "setIsInHoldToAction:", 1);
    -[UIGestureRecognizer setState:](self, "setState:", 1);
  }
}

- (void)scheduleHoldToAction
{
  -[_UITapTapHoldGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_holdToAction_, 0, 0.5);
  self->_isWaitingForHoldToAction = 1;
}

- (void)cancelPendingHoldToAction
{
  if (self->_isWaitingForHoldToAction)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_holdToAction_, 0);
    self->_isWaitingForHoldToAction = 0;
  }
}

- (BOOL)_shouldFailInResponseToPresses:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  char v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  if (+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI"))
  {
    -[UIGestureRecognizer allowedTouchTypes](self, "allowedTouchTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsObject:", &unk_1E1A98640) & 1) != 0)
    {
      v7 = _UIPressesContainsPressType(v5, 4);

      if ((v7 & 1) != 0)
      {
        LOBYTE(v8) = 1;
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  if (-[UITapGestureRecognizer isSingleKeyPressGesture](self, "isSingleKeyPressGesture")
    && (-[UIGestureRecognizer allowedPressTypes](self, "allowedPressTypes"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v10))
  {
    -[UIGestureRecognizer allowedPressTypes](self, "allowedPressTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _UIPressesOnlyContainsPressTypes(v5, v11) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }
LABEL_10:

  return v8;
}

- (int64_t)gestureType
{
  return self->_gestureType;
}

- (void)setGestureType:(int64_t)a3
{
  self->_gestureType = a3;
}

- (int)currentNumberOfPresses
{
  return self->_currentNumberOfPresses;
}

- (void)setCurrentNumberOfPresses:(int)a3
{
  self->_currentNumberOfPresses = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)pressEventBeginTimestamp
{
  return self->_pressEventBeginTimestamp;
}

- (void)setPressEventBeginTimestamp:(double)a3
{
  self->_pressEventBeginTimestamp = a3;
}

- (BOOL)isWaitingForHoldToAction
{
  return self->_isWaitingForHoldToAction;
}

- (void)setIsWaitingForHoldToAction:(BOOL)a3
{
  self->_isWaitingForHoldToAction = a3;
}

- (BOOL)isInHoldToAction
{
  return self->_isInHoldToAction;
}

- (void)setIsInHoldToAction:(BOOL)a3
{
  self->_isInHoldToAction = a3;
}

- (BOOL)isWaitingForTooSlowForDoubleTap
{
  return self->_isWaitingForTooSlowForDoubleTap;
}

- (void)setIsWaitingForTooSlowForDoubleTap:(BOOL)a3
{
  self->_isWaitingForTooSlowForDoubleTap = a3;
}

@end
