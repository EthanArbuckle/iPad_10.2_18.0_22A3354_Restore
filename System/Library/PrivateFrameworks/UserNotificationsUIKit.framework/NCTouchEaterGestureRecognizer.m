@implementation NCTouchEaterGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[NCTouchEaterGestureRecognizer setState:](self, "setState:", 3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[NCTouchEaterGestureRecognizer setState:](self, "setState:", 4, a4);
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

@end
