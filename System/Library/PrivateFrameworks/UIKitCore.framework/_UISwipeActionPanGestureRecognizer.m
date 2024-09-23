@implementation _UISwipeActionPanGestureRecognizer

- (_UISwipeActionPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UISwipeActionPanGestureRecognizer *v4;
  _UISwipeActionPanGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISwipeActionPanGestureRecognizer;
  v4 = -[UIPanGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v4, "setAllowedScrollTypesMask:", 3);
    -[UIPanGestureRecognizer _setiOSMacUseNonacceleratedDelta:](v5, "_setiOSMacUseNonacceleratedDelta:", 1);
  }
  return v5;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "_containsHIDPointerEvent") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UISwipeActionPanGestureRecognizer;
    v8 = -[UIGestureRecognizer _shouldReceiveTouch:withEvent:](&v10, sel__shouldReceiveTouch_withEvent_, v6, v7);
  }

  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    -[UIPanGestureRecognizer _activeTouches]((id *)&self->super.super.super.isa);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
      -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
  v10.receiver = self;
  v10.super_class = (Class)_UISwipeActionPanGestureRecognizer;
  -[UIPanGestureRecognizer touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v6, v7);

}

@end
