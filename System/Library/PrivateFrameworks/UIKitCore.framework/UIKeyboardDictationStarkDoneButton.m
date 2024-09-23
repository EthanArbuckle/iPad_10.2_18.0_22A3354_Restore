@implementation UIKeyboardDictationStarkDoneButton

- (UIKeyboardDictationStarkDoneButton)initWithFrame:(CGRect)a3
{
  UIKeyboardDictationStarkDoneButton *v3;
  void *v4;
  UIKeyboardDictationStarkDoneButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardDictationStarkDoneButton;
  v3 = -[UIButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = v3;
  }

  return v3;
}

- (void)drawRect:(CGRect)a3
{
  void *v3;
  id v4;
  CGRect v5;
  CGRect v6;

  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = CGRectInset(v5, 4.0, 4.0);
  +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, v6.size.height * 0.5, v6.size.height * 0.5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[UIColor blackColor](UIColor, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");

  objc_msgSend(v4, "fill");
}

@end
