@implementation ICQPreferencesRemoteUIDelegateBorderedButton

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGContext *CurrentContext;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ICQPreferencesRemoteUIDelegateBorderedButton;
  -[ICQPreferencesRemoteUIDelegateBorderedButton drawRect:](&v14, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ICQPreferencesRemoteUIDelegateBorderedButton bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 1.0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.78, 1.0);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v13, "CGColor"));

  CGContextMoveToPoint(CurrentContext, v5, v7);
  CGContextAddLineToPoint(CurrentContext, v9, v7);
  CGContextMoveToPoint(CurrentContext, v5, v11);
  CGContextAddLineToPoint(CurrentContext, v9, v11);
  CGContextStrokePath(CurrentContext);
}

@end
