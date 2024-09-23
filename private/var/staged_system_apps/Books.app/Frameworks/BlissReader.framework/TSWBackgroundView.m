@implementation TSWBackgroundView

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *CurrentContext;
  objc_super v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->mGradient)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"));
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    CGContextFillRect(CurrentContext, v10);
    CGContextRestoreGState(CurrentContext);
    -[TSDGradient paintRect:inContext:](self->mGradient, "paintRect:inContext:", CurrentContext, x, y, width, height);
  }
  v9.receiver = self;
  v9.super_class = (Class)TSWBackgroundView;
  -[TSWBackgroundView drawRect:](&v9, "drawRect:", x, y, width, height);
}

- (void)dealloc
{
  objc_super v3;

  self->mGradient = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWBackgroundView;
  -[TSWBackgroundView dealloc](&v3, "dealloc");
}

- (BOOL)isOpaque
{
  return 0;
}

- (TSDGradient)gradient
{
  return self->mGradient;
}

- (void)setGradient:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
