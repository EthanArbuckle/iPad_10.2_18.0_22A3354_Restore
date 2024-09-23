@implementation SUInnerShadowLabel

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *CurrentContext;
  CGColor *v9;
  CGColor *v10;
  objc_super v11;
  objc_super v12;
  CGSize v13;
  CGSize v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = (CGColor *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), "CGColor");
  v13.width = 0.0;
  v13.height = 1.0;
  CGContextSetShadowWithColor(CurrentContext, v13, 0.0, v9);
  CGContextBeginTransparencyLayer(CurrentContext, 0);
  v12.receiver = self;
  v12.super_class = (Class)SUInnerShadowLabel;
  -[SUInnerShadowLabel drawRect:](&v12, sel_drawRect_, x, y, width, height);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceAtop);
  CGContextBeginTransparencyLayer(CurrentContext, 0);
  v10 = (CGColor *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.45), "CGColor");
  v14.width = 0.0;
  v14.height = 1.0;
  CGContextSetShadowWithColor(CurrentContext, v14, 0.0, v10);
  CGContextBeginTransparencyLayer(CurrentContext, 0);
  -[SUInnerShadowLabel bounds](self, "bounds");
  CGContextFillRect(CurrentContext, v15);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationOut);
  v11.receiver = self;
  v11.super_class = (Class)SUInnerShadowLabel;
  -[SUInnerShadowLabel drawRect:](&v11, sel_drawRect_, x, y, width, height);
  CGContextEndTransparencyLayer(CurrentContext);
  CGContextEndTransparencyLayer(CurrentContext);
  CGContextEndTransparencyLayer(CurrentContext);
}

@end
