@implementation _UIPendingEdgeSwipeGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  if (_UIEventHasEdgePendingOrLocked(a4))
    v5 = 1;
  else
    v5 = 5;
  -[UIGestureRecognizer setState:](self, "setState:", v5);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (-[UIGestureRecognizer state](self, "state", a3, a4) == UIGestureRecognizerStatePossible)
    -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (-[UIGestureRecognizer state](self, "state", a3, a4) <= UIGestureRecognizerStateChanged)
    -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 4, a4);
}

@end
