@implementation WebPlainWhiteView

- (void)drawRect:(CGRect)a3
{
  CGContext *v4;
  CGColor *color;

  v4 = (CGContext *)WKGetCurrentGraphicsContext();
  WebCore::cachedCGColor();
  CGContextSetFillColorWithColor(v4, color);
  if (color)
    CFRelease(color);
  -[WebPlainWhiteView bounds](self, "bounds", 0x11040000FFFFFFFFLL, 0);
  WKRectFill();
}

- (id)elementAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)elementAtPoint:(CGPoint)a3 allowShadowContent:(BOOL)a4
{
  return 0;
}

@end
