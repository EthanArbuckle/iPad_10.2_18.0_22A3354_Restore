@implementation SUMaskProvider

- (id)copyMaskImageWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  id result;
  const CGPath *v6;
  double v7;
  CGFloat v8;
  CGContext *CurrentContext;
  UIImage *v10;
  CGSize v11;

  height = a3.height;
  width = a3.width;
  result = -[SUMaskProvider copyPathForMaskWithSize:](self, "copyPathForMaskWithSize:");
  if (result)
  {
    v6 = (const CGPath *)result;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    v8 = v7;
    v11.width = width;
    v11.height = height;
    UIGraphicsBeginImageContextWithOptions(v11, 0, v8);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextAddPath(CurrentContext, v6);
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "blackColor"), "CGColor"));
    CGContextFillPath(CurrentContext);
    v10 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGPathRelease(v6);
    return v10;
  }
  return result;
}

- (CGPath)copyPathForMaskWithSize:(CGSize)a3
{
  return 0;
}

@end
