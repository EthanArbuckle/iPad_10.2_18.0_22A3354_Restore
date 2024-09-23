@implementation _UIAccessibilityHUDLongPressGestureRecognizer

- (_UIAccessibilityHUDLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIAccessibilityHUDLongPressGestureRecognizer *v4;
  _UIAccessibilityHUDLongPressGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIAccessibilityHUDLongPressGestureRecognizer;
  v4 = -[UILongPressGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[UILongPressGestureRecognizer set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:](v4, "set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:", 1);
  return v5;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

@end
