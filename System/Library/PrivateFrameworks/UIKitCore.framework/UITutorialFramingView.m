@implementation UITutorialFramingView

- (UITutorialFramingView)initWithFrame:(CGRect)a3
{
  UITutorialFramingView *v3;
  UITutorialFramingView *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UITutorialFramingView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
    -[UIView widthAnchor](v4, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView heightAnchor](v4, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:multiplier:", v8, dbl_186679290[v6]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);

  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  void *v3;
  id v4;
  CGRect v5;

  v5 = CGRectInset(a3, 5.0, 5.0);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height, 14.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStroke");

  objc_msgSend(v4, "setLineWidth:", 6.0);
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    objc_msgSend(v4, "setLineWidth:", 10.0);
  objc_msgSend(v4, "stroke");

}

@end
