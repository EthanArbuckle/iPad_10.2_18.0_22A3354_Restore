@implementation UIInputSwitcherGestureState

- (BOOL)gestureConflictsWithTypingWindow
{
  void *v3;
  double v4;
  double v5;
  BOOL v6;
  double v7;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastTouchDownTimestamp");
  v5 = v4;

  v6 = CFAbsoluteTimeGetCurrent() - v5 < 0.325;
  -[UIInputSwitcherGestureState lastSeenKeyboardTouchDown](self, "lastSeenKeyboardTouchDown");
  return vabdd_f64(v5, v7) > 0.00000011920929 || v6;
}

- (BOOL)didMoveBeyondThreshold
{
  return self->_didMoveBeyondThreshold;
}

- (void)setDidMoveBeyondThreshold:(BOOL)a3
{
  self->_didMoveBeyondThreshold = a3;
}

- (BOOL)hideSwitcher
{
  return self->_hideSwitcher;
}

- (void)setHideSwitcher:(BOOL)a3
{
  self->_hideSwitcher = a3;
}

- (CGPoint)firstReferencePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_firstReferencePoint.x;
  y = self->_firstReferencePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFirstReferencePoint:(CGPoint)a3
{
  self->_firstReferencePoint = a3;
}

- (double)touchDown
{
  return self->_touchDown;
}

- (void)setTouchDown:(double)a3
{
  self->_touchDown = a3;
}

- (double)lastSeenKeyboardTouchDown
{
  return self->_lastSeenKeyboardTouchDown;
}

- (void)setLastSeenKeyboardTouchDown:(double)a3
{
  self->_lastSeenKeyboardTouchDown = a3;
}

@end
