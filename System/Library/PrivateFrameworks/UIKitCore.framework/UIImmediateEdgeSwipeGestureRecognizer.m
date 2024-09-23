@implementation UIImmediateEdgeSwipeGestureRecognizer

- (void)_processTouches:(id)a3 withEvent:(id)a4
{
  uint64_t v6;

  if (-[UIGestureRecognizer state](self, "state", a3) == UIGestureRecognizerStatePossible)
  {
    if (_UIEventHasEdgePendingOrLocked(a4))
      v6 = 3;
    else
      v6 = 5;
    -[UIGestureRecognizer setState:](self, "setState:", v6);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 4, a4);
}

@end
