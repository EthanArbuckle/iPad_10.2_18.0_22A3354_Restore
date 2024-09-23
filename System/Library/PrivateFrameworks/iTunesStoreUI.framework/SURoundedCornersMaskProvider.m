@implementation SURoundedCornersMaskProvider

- (CGPath)copyPathForMaskWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  CGPath *result;

  height = a3.height;
  width = a3.width;
  v5 = (void *)MEMORY[0x24BDF6870];
  -[SURoundedCornersMaskProvider cornerRadius](self, "cornerRadius");
  result = (CGPath *)objc_msgSend((id)objc_msgSend(v5, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, width, height, v6), "CGPath");
  if (result)
    return CGPathRetain(result);
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

@end
