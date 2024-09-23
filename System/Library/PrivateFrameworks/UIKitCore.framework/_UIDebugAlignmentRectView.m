@implementation _UIDebugAlignmentRectView

- (_UIDebugAlignmentRectView)initWithFrame:(CGRect)a3 baselineOffset:(double)a4
{
  _UIDebugAlignmentRectView *v5;
  _UIDebugAlignmentRectView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIDebugAlignmentRectView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_baselineOffset = a4;
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    -[UIView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
  }
  return v6;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;

  -[UIColor set](+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 0.0, 0.8), "set");
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  UIRectFrameUsingOperation(1, v4, v6, v8, v10);
  if (self->_baselineOffset > 0.0)
  {
    -[UIScreen scale](-[UIWindow screen](-[UIView window](self, "window"), "screen"), "scale");
    UIRectFillUsingOperation(1, v5, v7 + v11 - self->_baselineOffset - 1.0 / v12, v9, 1.0 / v12);
  }
}

- (BOOL)isOpaque
{
  return 0;
}

@end
