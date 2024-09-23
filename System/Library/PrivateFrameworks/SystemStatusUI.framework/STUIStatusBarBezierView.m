@implementation STUIStatusBarBezierView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (STUIStatusBarBezierView)initWithFrame:(CGRect)a3
{
  STUIStatusBarBezierView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarBezierView;
  v3 = -[STUIStatusBarBezierView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[STUIStatusBarBezierView shapeLayer](v3, "shapeLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFillColor:", 0);

  return v3;
}

- (void)setBezierPath:(id)a3
{
  void *v5;
  UIBezierPath *v6;
  _BOOL4 v7;
  _QWORD *v8;
  UIBezierPath *v9;

  v9 = (UIBezierPath *)a3;
  if (self->_bezierPath != v9)
  {
    objc_storeStrong((id *)&self->_bezierPath, a3);
    -[STUIStatusBarBezierView shapeLayer](self, "shapeLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_retainAutorelease(v9);
    objc_msgSend(v5, "setPath:", -[UIBezierPath CGPath](v6, "CGPath"));
    -[UIBezierPath lineWidth](v6, "lineWidth");
    objc_msgSend(v5, "setLineWidth:");
    v7 = -[UIBezierPath usesEvenOddFillRule](v6, "usesEvenOddFillRule");
    v8 = (_QWORD *)MEMORY[0x1E0CD2B70];
    if (!v7)
      v8 = (_QWORD *)MEMORY[0x1E0CD2B78];
    objc_msgSend(v5, "setFillRule:", *v8);
    -[STUIStatusBarBezierView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

  }
}

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_alignmentRectInsets.left
    || a3.top != self->_alignmentRectInsets.top
    || a3.right != self->_alignmentRectInsets.right
    || a3.bottom != self->_alignmentRectInsets.bottom)
  {
    self->_alignmentRectInsets = a3;
    -[STUIStatusBarBezierView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
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
  CGSize result;

  -[UIBezierPath bounds](self->_bezierPath, "bounds");
  v4 = v3;
  v6 = v5;
  -[STUIStatusBarBezierView alignmentRectInsets](self, "alignmentRectInsets");
  v8 = v7;
  -[STUIStatusBarBezierView alignmentRectInsets](self, "alignmentRectInsets");
  v10 = v6 - (v8 + v9);
  -[STUIStatusBarBezierView alignmentRectInsets](self, "alignmentRectInsets");
  v12 = v11;
  -[STUIStatusBarBezierView alignmentRectInsets](self, "alignmentRectInsets");
  v14 = v4 - (v12 + v13);
  v15 = v10;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setFillColor:(id)a3
{
  uint64_t v5;
  void *v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  if (self->_fillColor != v7)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    v5 = -[UIColor CGColor](objc_retainAutorelease(v7), "CGColor");
    -[STUIStatusBarBezierView shapeLayer](self, "shapeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFillColor:", v5);

  }
}

- (void)setStrokeColor:(id)a3
{
  uint64_t v5;
  void *v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  if (self->_strokeColor != v7)
  {
    objc_storeStrong((id *)&self->_strokeColor, a3);
    v5 = -[UIColor CGColor](objc_retainAutorelease(v7), "CGColor");
    -[STUIStatusBarBezierView shapeLayer](self, "shapeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStrokeColor:", v5);

  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarBezierView;
  if (-[STUIStatusBarBezierView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4)
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("fillColor")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("strokeColor"));
  }

  return v5;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentRectInsets.top;
  left = self->_alignmentRectInsets.left;
  bottom = self->_alignmentRectInsets.bottom;
  right = self->_alignmentRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIBezierPath)bezierPath
{
  return self->_bezierPath;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_bezierPath, 0);
}

@end
