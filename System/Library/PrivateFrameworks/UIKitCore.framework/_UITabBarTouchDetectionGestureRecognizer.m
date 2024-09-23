@implementation _UITabBarTouchDetectionGestureRecognizer

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (-[UIGestureRecognizer state](self, "state", a3, a4) == UIGestureRecognizerStatePossible)
    -[UIGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (-[UIGestureRecognizer state](self, "state", a3, a4) >= UIGestureRecognizerStateBegan)
    -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (-[UIGestureRecognizer state](self, "state", a3, a4) >= UIGestureRecognizerStateBegan)
    -[UIGestureRecognizer setState:](self, "setState:", 4);
}

@end
