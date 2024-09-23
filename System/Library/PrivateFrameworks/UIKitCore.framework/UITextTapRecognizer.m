@implementation UITextTapRecognizer

- (UITextTapRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UITextTapRecognizer *v4;
  UITextTapRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITextTapRecognizer;
  v4 = -[UITapGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UITapGestureRecognizer setMaximumIntervalBetweenSuccessiveTaps:](v4, "setMaximumIntervalBetweenSuccessiveTaps:", 0.35);
    -[UITapGestureRecognizer setAllowableMovement:](v5, "setAllowableMovement:", 1.79769313e308);
    -[UIGestureRecognizer setName:](v5, "setName:", CFSTR("com.apple.UIKit.textTap"));
    -[UITextTapRecognizer setTouchBasedAllowableMovement:](v5, "setTouchBasedAllowableMovement:", -1.0);
  }
  return v5;
}

- (void)setTouchBasedAllowableMovement:(double)a3
{
  self->_touchBasedAllowableMovement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchesForTap, 0);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_isPointerTouch"))
  {
    -[UITextTapRecognizer touchBasedAllowableMovement](self, "touchBasedAllowableMovement");
    v10 = v9;

    if (v10 < 0.0)
    {
      -[UITapGestureRecognizer allowableMovement](self, "allowableMovement");
      -[UITextTapRecognizer setTouchBasedAllowableMovement:](self, "setTouchBasedAllowableMovement:");
      -[UITapGestureRecognizer setAllowableMovement:](self, "setAllowableMovement:", 1.0);
    }
  }
  else
  {

  }
  v11.receiver = self;
  v11.super_class = (Class)UITextTapRecognizer;
  -[UITapGestureRecognizer touchesBegan:withEvent:](&v11, sel_touchesBegan_withEvent_, v6, v7);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[UITapGestureRecognizer touches](self, "touches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextTapRecognizer setTouchesForTap:](self, "setTouchesForTap:", v8);

  v10.receiver = self;
  v10.super_class = (Class)UITextTapRecognizer;
  -[UITapGestureRecognizer touchesEnded:withEvent:](&v10, sel_touchesEnded_withEvent_, v7, v6);

  -[UITextTapRecognizer touchBasedAllowableMovement](self, "touchBasedAllowableMovement");
  if (v9 > 0.0)
  {
    -[UITextTapRecognizer touchBasedAllowableMovement](self, "touchBasedAllowableMovement");
    -[UITapGestureRecognizer setAllowableMovement:](self, "setAllowableMovement:");
    -[UITextTapRecognizer setTouchBasedAllowableMovement:](self, "setTouchBasedAllowableMovement:", -1.0);
  }
}

- (NSArray)touchesForTap
{
  return self->_touchesForTap;
}

- (void)setTouchesForTap:(id)a3
{
  objc_storeStrong((id *)&self->_touchesForTap, a3);
}

- (double)touchBasedAllowableMovement
{
  return self->_touchBasedAllowableMovement;
}

@end
