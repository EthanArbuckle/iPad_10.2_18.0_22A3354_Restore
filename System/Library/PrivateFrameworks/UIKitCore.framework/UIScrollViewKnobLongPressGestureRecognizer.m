@implementation UIScrollViewKnobLongPressGestureRecognizer

- (UIScrollViewKnobLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIScrollViewKnobLongPressGestureRecognizer *v4;
  UIScrollViewKnobLongPressGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIScrollViewKnobLongPressGestureRecognizer;
  v4 = -[UILongPressGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[UILongPressGestureRecognizer set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:](v4, "set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:", 1);
  return v5;
}

- (void)setForPointer:(BOOL)a3
{
  self->_forPointer = a3;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  char v5;

  v5 = objc_msgSend(a3, "_isPointerTouch");
  return v5 ^ -[UIScrollViewKnobLongPressGestureRecognizer forPointer](self, "forPointer") ^ 1;
}

- (BOOL)forPointer
{
  return self->_forPointer;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

@end
