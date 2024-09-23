@implementation _UIWebHighlightLongPressGestureRecognizer

- (void)cancel
{
  UIGestureRecognizerState v3;

  if (self && (*(_QWORD *)&self->super.super._gestureFlags & 0x200000000) != 0)
  {
    v3 = -[UIGestureRecognizer state](self, "state");
    if ((unint64_t)v3 <= UIGestureRecognizerStateChanged)
      -[UIGestureRecognizer setState:](self, "setState:", qword_186685B68[v3]);
  }
}

- (_UIWebHighlightLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIWebHighlightLongPressGestureRecognizer *v4;
  _UIWebHighlightLongPressGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIWebHighlightLongPressGestureRecognizer;
  v4 = -[UILongPressGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[UILongPressGestureRecognizer set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:](v4, "set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:", 1);
  return v5;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 15 || a3 == 1;
}

@end
