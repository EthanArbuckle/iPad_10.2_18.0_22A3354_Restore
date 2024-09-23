@implementation _UIPassthroughGateGestureRecognizer

- (_UIPassthroughGateGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIPassthroughGateGestureRecognizer *v4;
  _UIPassthroughGateGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPassthroughGateGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, self, a4);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)&v4->super._gestureFlags + 8) &= ~8u;
    -[UIGestureRecognizer _setRequiresSystemGesturesToFail:](v4, "_setRequiresSystemGesturesToFail:", 1);
  }
  return v5;
}

+ (BOOL)_supportsTouchContinuation
{
  return 0;
}

- (void)open
{
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)endClosed
{
  -[UIGestureRecognizer setState:](self, "setState:", 3);
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v13;

  -[UIGestureRecognizer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[UIGestureRecognizer view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    v13 = objc_msgSend(v7, "_passthroughGestureRecognizer:shouldInteractAtLocation:withEvent:", self, a4, v10, v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char v12;
  objc_super v14;

  if (objc_msgSend(a3, "type") == 10)
  {
    -[UIGestureRecognizer delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = a3;
      -[UIGestureRecognizer view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationInView:", v7);
      v9 = v8;
      v11 = v10;

      v12 = objc_msgSend(v5, "_passthroughGestureRecognizer:shouldInteractAtLocation:withEvent:", self, v6, v9, v11);
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIPassthroughGateGestureRecognizer;
    return -[UIGestureRecognizer shouldReceiveEvent:](&v14, sel_shouldReceiveEvent_, a3);
  }
  return v12;
}

@end
