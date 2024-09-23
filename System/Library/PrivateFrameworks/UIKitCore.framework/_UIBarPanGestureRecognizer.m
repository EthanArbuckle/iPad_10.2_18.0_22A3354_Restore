@implementation _UIBarPanGestureRecognizer

- (_UIBarPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIBarPanGestureRecognizer *v4;
  _UIBarPanGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIBarPanGestureRecognizer;
  v4 = -[UIPanGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](v4, "setMinimumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v5, "setMaximumNumberOfTouches:", 1);
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("You cannot change the delegate of the UINavigationController's barHideOnSwipeGestureRecognizer"));
}

- (void)_setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIBarPanGestureRecognizer;
  -[UIPanGestureRecognizer setDelegate:](&v3, sel_setDelegate_, a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  self->_barAction = 0;
  self->_bias = 0.0;
  v4.receiver = self;
  v4.super_class = (Class)_UIBarPanGestureRecognizer;
  -[UIPanGestureRecognizer touchesBegan:withEvent:](&v4, sel_touchesBegan_withEvent_, a3, a4);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  char v11;
  int64_t v12;
  char v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIBarPanGestureRecognizer;
  -[UIPanGestureRecognizer touchesMoved:withEvent:](&v14, sel_touchesMoved_withEvent_, a3, a4);
  -[UIGestureRecognizer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNavigationBarHidden");

  if (!self->_barAction)
  {
    -[UIGestureRecognizer view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer translationInView:](self, "translationInView:", v7);
    v9 = v8;

    -[UIPanGestureRecognizer _hysteresis](self, "_hysteresis");
    if (v9 > v10)
      v11 = v6;
    else
      v11 = 0;
    if ((v11 & 1) != 0)
    {
      v12 = 2;
LABEL_12:
      self->_bias = v9;
      self->_barAction = v12;
      return;
    }
    if (v9 >= -v10)
      v13 = 1;
    else
      v13 = v6;
    if ((v13 & 1) == 0)
    {
      v12 = 1;
      goto LABEL_12;
    }
  }
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "_isGestureType:", 8) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIBarPanGestureRecognizer;
    v5 = -[UIGestureRecognizer canPreventGestureRecognizer:](&v7, sel_canPreventGestureRecognizer_, v4);
  }

  return v5;
}

- (id)description
{
  unint64_t barAction;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  barAction = self->_barAction;
  if (barAction > 2)
    v3 = &stru_1E16EDF20;
  else
    v3 = off_1E16B5B60[barAction];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_UIBarPanGestureRecognizer;
  -[UIGestureRecognizer description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ action=%@"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)barAction
{
  return self->_barAction;
}

- (double)bias
{
  return self->_bias;
}

@end
