@implementation _UIRelationshipGestureRecognizer

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 14;
}

- (_UIRelationshipGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIRelationshipGestureRecognizer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIRelationshipGestureRecognizer;
  result = -[UIGestureRecognizer initWithTarget:action:](&v5, sel_initWithTarget_action_, a3, a4);
  if (result)
    result->_failsOnTouchesCancelled = 1;
  return result;
}

- (void)_fail
{
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (-[_UIRelationshipGestureRecognizer succeedsOnTouchesEnded](self, "succeedsOnTouchesEnded", a3, a4))
    -[_UIRelationshipGestureRecognizer _succeed](self, "_succeed");
  else
    -[_UIRelationshipGestureRecognizer _fail](self, "_fail");
}

- (BOOL)succeedsOnTouchesEnded
{
  return self->_succeedsOnTouchesEnded;
}

- (void)_succeed
{
  -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (-[_UIRelationshipGestureRecognizer failsOnTouchesCancelled](self, "failsOnTouchesCancelled", a3, a4))
    -[_UIRelationshipGestureRecognizer _fail](self, "_fail");
  else
    -[_UIRelationshipGestureRecognizer _succeed](self, "_succeed");
}

- (void)setSucceedsOnTouchesEnded:(BOOL)a3
{
  self->_succeedsOnTouchesEnded = a3;
}

- (BOOL)failsOnTouchesCancelled
{
  return self->_failsOnTouchesCancelled;
}

- (void)setFailsOnTouchesCancelled:(BOOL)a3
{
  self->_failsOnTouchesCancelled = a3;
}

@end
