@implementation UITableViewCellContentMirror

- (void)setSelected:(BOOL)a3
{
  *((_BYTE *)self + 416) = *((_BYTE *)self + 416) & 0xFE | a3;
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)isSelected
{
  return *((_BYTE *)self + 416) & 1;
}

- (UITableViewCellContentMirror)initWithFrame:(CGRect)a3
{
  UITableViewCellContentMirror *v3;
  UITableViewCellContentMirror *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITableViewCellContentMirror;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    +[UIColor clearColor](UIColor, "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[UIView setNeedsDisplayOnBoundsChange:](v4, "setNeedsDisplayOnBoundsChange:", 1);
  }
  return v4;
}

- (id)cell
{
  void *v3;
  void *v4;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UITableViewCellContentMirror cell](self, "cell");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_drawContentInRect:selected:", *((_BYTE *)self + 416) & 1, x, y, width, height);

}

@end
