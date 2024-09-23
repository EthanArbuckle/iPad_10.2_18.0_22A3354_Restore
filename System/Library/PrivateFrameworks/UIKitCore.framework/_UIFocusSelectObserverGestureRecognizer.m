@implementation _UIFocusSelectObserverGestureRecognizer

- (_UIFocusSelectObserverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIFocusSelectObserverGestureRecognizer *v4;
  _UIFocusSelectObserverGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFocusSelectObserverGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &unk_1E1A92B58);
    -[UIGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v5, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    -[UIGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 0);
  }
  return v5;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 1, a4);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 3, a4);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 4, a4);
}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 0;
}

@end
