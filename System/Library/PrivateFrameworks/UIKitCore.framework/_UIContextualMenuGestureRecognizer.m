@implementation _UIContextualMenuGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;

  if (-[UIGestureRecognizer state](self, "state", a3) == UIGestureRecognizerStatePossible)
  {
    if (a4 && ((objc_msgSend(a4, "_modifierFlags") & 0x40000) != 0 || (objc_msgSend(a4, "_buttonMask") & 2) != 0))
      v6 = 1;
    else
      v6 = 5;
    -[UIGestureRecognizer setState:](self, "setState:", v6);
  }
}

- (int64_t)_defaultAllowedMouseButtons
{
  return 3;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (-[UIGestureRecognizer state](self, "state", a3, a4) == UIGestureRecognizerStateBegan
    || -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateChanged)
  {
    -[UIGestureRecognizer setState:](self, "setState:", 2);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (-[UIGestureRecognizer state](self, "state", a3, a4) == UIGestureRecognizerStateBegan
    || -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateChanged)
  {
    -[UIGestureRecognizer setState:](self, "setState:", 3);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  if (-[UIGestureRecognizer state](self, "state", a3, a4) > UIGestureRecognizerStatePossible)
    v5 = 4;
  else
    v5 = 5;
  -[UIGestureRecognizer setState:](self, "setState:", v5);
}

@end
