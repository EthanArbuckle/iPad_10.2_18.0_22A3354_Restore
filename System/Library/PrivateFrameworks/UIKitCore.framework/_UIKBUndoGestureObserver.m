@implementation _UIKBUndoGestureObserver

+ (id)undoGestureObserverWithTarget:(id)a3 action:(SEL)a4 delegate:(id)a5
{
  id v7;
  id v8;
  _UIKBUndoGestureObserver *v9;
  _UIKBUndoGestureObserver *v10;

  v7 = a5;
  v8 = a3;
  v9 = -[UIGestureRecognizer initWithTarget:action:]([_UIKBUndoGestureObserver alloc], "initWithTarget:action:", v8, a4);

  if (v9)
  {
    -[UIGestureRecognizer setName:](v9, "setName:", CFSTR("com.apple.UIKit.undointeraction.dismissHUD"));
    -[UIGestureRecognizer setDelegate:](v9, "setDelegate:", v7);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v9, "setDelaysTouchesEnded:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](v9, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setRequiresExclusiveTouchType:](v9, "setRequiresExclusiveTouchType:", 0);
    v10 = v9;
  }

  return v9;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (-[UIGestureRecognizer numberOfTouches](self, "numberOfTouches", a3, a4) != 3
    && -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    -[UIGestureRecognizer setState:](self, "setState:", 3);
  }
  -[_UIKBUndoGestureObserver _failOrCancelIfNecessary](self, "_failOrCancelIfNecessary");
}

- (void)_failOrCancelIfNecessary
{
  uint64_t v3;

  if (-[UIGestureRecognizer state](self, "state") != UIGestureRecognizerStateEnded)
  {
    if (-[UIGestureRecognizer state](self, "state") > UIGestureRecognizerStatePossible)
      v3 = 4;
    else
      v3 = 5;
    -[UIGestureRecognizer setState:](self, "setState:", v3);
  }
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_affectedByGesture:(id)a3
{
  _BOOL8 v3;

  if (a3)
    return HIWORD(*((_QWORD *)a3 + 1)) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)_analyticsIsGestureHandled
{
  return 1;
}

@end
