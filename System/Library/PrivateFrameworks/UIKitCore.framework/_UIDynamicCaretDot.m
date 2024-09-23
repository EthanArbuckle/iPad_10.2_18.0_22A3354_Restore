@implementation _UIDynamicCaretDot

- (_UIDynamicCaretDot)initWithFrame:(CGRect)a3
{
  _UIDynamicCaretDot *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDynamicCaretDot;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[UIView setOpaque:](v3, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.5);

  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  double width;
  void *v5;
  objc_super v6;

  width = a3.size.width;
  v6.receiver = self;
  v6.super_class = (Class)_UIDynamicCaretDot;
  -[UIView setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", width * 0.5);

}

@end
