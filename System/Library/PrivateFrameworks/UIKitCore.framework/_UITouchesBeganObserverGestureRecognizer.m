@implementation _UITouchesBeganObserverGestureRecognizer

- (void)initWithTarget:(uint64_t)a3 action:(uint64_t)a4 name:
{
  id v5;
  void *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)_UITouchesBeganObserverGestureRecognizer;
  v5 = objc_msgSendSuper2(&v8, sel_initWithTarget_action_, a2, a3);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setName:", a4);
    objc_msgSend(v6, "setAllowedTouchTypes:", &unk_1E1A936E0);
    objc_msgSend(v6, "setAllowedPressTypes:", MEMORY[0x1E0C9AA60]);
    objc_msgSend(v6, "setCancelsTouchesInView:", 0);
    objc_msgSend(v6, "setDelaysTouchesBegan:", 0);
    objc_msgSend(v6, "setDelaysTouchesEnded:", 0);
    objc_msgSend(v6, "_setAcceptsFailureRequiments:", 0);
  }
  return v6;
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

- (BOOL)shouldReceiveEvent:(id)a3
{
  return objc_msgSend(a3, "type") == 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 3, a4);
}

@end
