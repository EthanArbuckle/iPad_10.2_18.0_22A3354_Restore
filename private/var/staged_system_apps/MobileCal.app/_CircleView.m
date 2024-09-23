@implementation _CircleView

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  if (self->_usesRoundedRectInsteadOfCircle != a3)
  {
    self->_usesRoundedRectInsteadOfCircle = a3;
    -[_CircleView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  CGContext *CurrentContext;
  id v7;
  CGRect v8;
  CGRect v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_CircleView backgroundColor](self, "backgroundColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  objc_msgSend(v4, "setFill");

  -[_CircleView bounds](self, "bounds");
  UIRectFill(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_CircleView tintColor](self, "tintColor"));
  objc_msgSend(v5, "setFill");

  if (-[_CircleView usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle"))
  {
    -[_CircleView bounds](self, "bounds");
    v7 = (id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:"));
    objc_msgSend(v7, "fill");

  }
  else
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    -[_CircleView bounds](self, "bounds");
    CGContextFillEllipseInRect(CurrentContext, v9);
  }
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_CircleView;
  -[_CircleView tintColorDidChange](&v4, "tintColorDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_CircleView layer](self, "layer"));
  objc_msgSend(v3, "setNeedsDisplay");

}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return self->_usesRoundedRectInsteadOfCircle;
}

@end
