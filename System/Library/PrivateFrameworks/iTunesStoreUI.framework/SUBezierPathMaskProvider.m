@implementation SUBezierPathMaskProvider

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUBezierPathMaskProvider;
  -[SUBezierPathMaskProvider dealloc](&v3, sel_dealloc);
}

- (CGPath)copyPathForMaskWithSize:(CGSize)a3
{
  CGPath *result;

  result = -[UIBezierPath CGPath](self->_bezierPath, "CGPath", a3.width, a3.height);
  if (result)
    return CGPathRetain(result);
  return result;
}

- (UIBezierPath)bezierPath
{
  return self->_bezierPath;
}

- (void)setBezierPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
