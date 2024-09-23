@implementation TSWPDropCapBackgroundAdornment

- (TSWPDropCapBackgroundAdornment)initWithColor:(id)a3 bounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TSWPDropCapBackgroundAdornment *v9;
  objc_super v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)TSWPDropCapBackgroundAdornment;
  v9 = -[TSWPDropCapBackgroundAdornment init](&v11, sel_init);
  if (v9)
  {
    v9->_color = (TSUColor *)objc_msgSend(a3, "copy");
    v9->_bounds.origin.x = x;
    v9->_bounds.origin.y = y;
    v9->_bounds.size.width = width;
    v9->_bounds.size.height = height;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPDropCapBackgroundAdornment;
  -[TSWPDropCapBackgroundAdornment dealloc](&v3, sel_dealloc);
}

- (BOOL)isBackground
{
  return 1;
}

- (void)drawAdornmentForFragment:(const void *)a3 inContext:(CGContext *)a4 withFlags:(unsigned int)a5 state:(const void *)a6 bounds:(CGRect)a7
{
  CGFloat y;
  CGFloat x;
  CGRect v11;

  y = a7.origin.y;
  x = a7.origin.x;
  CGContextSetFillColorWithColor(a4, (CGColorRef)-[TSUColor CGColor](self->_color, "CGColor", a3, a4, *(_QWORD *)&a5, a6, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height));
  v11 = CGRectOffset(self->_bounds, x, y);
  CGContextFillRect(a4, v11);
}

@end
