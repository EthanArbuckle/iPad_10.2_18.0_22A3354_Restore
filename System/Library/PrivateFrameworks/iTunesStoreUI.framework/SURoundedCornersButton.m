@implementation SURoundedCornersButton

- (SURoundedCornersButton)initWithFrame:(CGRect)a3
{
  SURoundedCornersButton *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SURoundedCornersButton;
  v3 = -[SURoundedCornersButton initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    -[SURoundedCornersButton setBackgroundColor:](v3, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    -[SURoundedCornersButton setRequiresDisplayOnTracking:](v3, "setRequiresDisplayOnTracking:", 1);
    -[SURoundedCornersButton setTitleEdgeInsets:](v3, "setTitleEdgeInsets:", 0.0, 15.0, 0.0, 15.0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SURoundedCornersButton;
  -[SUSubtitledButton dealloc](&v3, sel_dealloc);
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SURoundedCornersButton bounds](self, "bounds");
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  if (!self->_bezierPath)
  {
    v18 = CGRectInset(*(CGRect *)&v8, 0.5, 0.5);
    self->_bezierPath = (UIBezierPath *)(id)objc_msgSend(MEMORY[0x24BDF6870], "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v18.origin.x, v18.origin.y, v18.size.width, v18.size.height + -1.0, 10.0);
  }
  if (!self->_shadowPath)
  {
    v19.origin.x = v12;
    v19.origin.y = v13;
    v19.size.width = v14;
    v19.size.height = v15;
    CGRectInset(v19, 0.5, 0.5);
    v16 = (void *)MEMORY[0x24BDF6870];
    v20.origin.x = v12;
    v20.origin.y = v13;
    v20.size.width = v14;
    v20.size.height = v15;
    v21 = CGRectInset(v20, 0.5, 0.5);
    self->_shadowPath = (UIBezierPath *)(id)objc_msgSend(v16, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, 10.0);
  }
  if ((-[SURoundedCornersButton isHighlighted](self, "isHighlighted") & 1) != 0
    || (-[SURoundedCornersButton isSelected](self, "isSelected") & 1) != 0)
  {
    v17 = -[SURoundedCornersButton _highlightedBackgroundView](self, "_highlightedBackgroundView");
    objc_msgSend(v17, "setFrame:", v12, v13, v14, v15);
    -[UIBezierPath clip](self->_bezierPath, "clip");
    objc_msgSend(v17, "drawRect:", x, y, width, height);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), "set");
    -[UIBezierPath fill](self->_bezierPath, "fill");
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.949999988, 1.0), "set");
  -[UIBezierPath stroke](self->_shadowPath, "stroke");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "tableSeparatorDarkColor"), "set");
  -[UIBezierPath stroke](self->_bezierPath, "stroke");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SURoundedCornersButton frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)SURoundedCornersButton;
  -[SURoundedCornersButton setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
  {

    self->_bezierPath = 0;
    self->_shadowPath = 0;
  }
}

- (id)_highlightedBackgroundView
{
  id result;
  void *v4;

  result = self->_highlightedBackgroundView;
  if (!result)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, 0);
    objc_msgSend(v4, "setHighlighted:", 1);
    self->_highlightedBackgroundView = (UIView *)(id)objc_msgSend(v4, "selectedBackgroundView");

    return self->_highlightedBackgroundView;
  }
  return result;
}

@end
