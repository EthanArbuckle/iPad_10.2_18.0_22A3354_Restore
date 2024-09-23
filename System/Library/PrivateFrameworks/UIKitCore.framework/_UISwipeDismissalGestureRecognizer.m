@implementation _UISwipeDismissalGestureRecognizer

- (_UISwipeDismissalGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UISwipeDismissalGestureRecognizer *v4;
  _UISwipeDismissalGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISwipeDismissalGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_UISwipeDismissalGestureRecognizer setAllowableMovement:](v4, "setAllowableMovement:", 10.0);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v5, "setDelaysTouchesBegan:", 1);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 1);
  }
  return v5;
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "anyObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v5);
  -[_UISwipeDismissalGestureRecognizer setOriginalTouchPoint:](self, "setOriginalTouchPoint:");

  -[UIGestureRecognizer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v6, "gestureRecognizerShouldDismissForTouchDown:", self))
  {
    -[UIGestureRecognizer setState:](self, "setState:", 3);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  objc_msgSend(a3, "anyObject");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[_UISwipeDismissalGestureRecognizer originalTouchPoint](self, "originalTouchPoint");
  v11 = v10;
  -[_UISwipeDismissalGestureRecognizer originalTouchPoint](self, "originalTouchPoint");
  v13 = v7 - v12;
  if (v13 >= 0.0)
    v14 = v13;
  else
    v14 = -v13;
  -[_UISwipeDismissalGestureRecognizer allowableMovement](self, "allowableMovement");
  if (v14 > v15
    || (v9 - v11 >= 0.0 ? (v16 = v9 - v11) : (v16 = -(v9 - v11)),
        -[_UISwipeDismissalGestureRecognizer allowableMovement](self, "allowableMovement"),
        v16 > v17))
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  id v6;

  -[UIGestureRecognizer delegate](self, "delegate", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v6, "gestureRecognizerShouldDismissForTouchUp:", self) & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    v5 = 5;
  }
  -[UIGestureRecognizer setState:](self, "setState:", v5);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 5, a4);
}

- (void)reset
{
  objc_super v3;

  -[_UISwipeDismissalGestureRecognizer setOriginalTouchPoint:](self, "setOriginalTouchPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v3.receiver = self;
  v3.super_class = (Class)_UISwipeDismissalGestureRecognizer;
  -[UIGestureRecognizer reset](&v3, sel_reset);
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (CGPoint)originalTouchPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalTouchPoint.x;
  y = self->_originalTouchPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginalTouchPoint:(CGPoint)a3
{
  self->_originalTouchPoint = a3;
}

@end
