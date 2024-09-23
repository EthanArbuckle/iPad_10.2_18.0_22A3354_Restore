@implementation UIColor(TSDPathPainter)

- (void)drawSwatchInRect:()TSDPathPainter inContext:
{
  CGRect v13;

  CGContextSaveGState(c);
  CGContextSetFillColorWithColor(c, (CGColorRef)objc_msgSend(a1, "CGColor"));
  v13.origin.x = a4;
  v13.origin.y = a5;
  v13.size.width = a6;
  v13.size.height = a7;
  CGContextFillRect(c, v13);
  CGContextRestoreGState(c);
}

- (void)paintPath:()TSDPathPainter inContext:
{
  CGContextSaveGState(c);
  CGContextSetFillColorWithColor(c, (CGColorRef)objc_msgSend(a1, "CGColor"));
  CGContextBeginPath(c);
  CGContextAddPath(c, a3);
  CGContextFillPath(c);
  CGContextRestoreGState(c);
}

@end
