@implementation UIPDFTextAnnotation

- (int)annotationType
{
  return 7;
}

- (void)drawInContext:(CGContext *)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v12;

  -[UIPDFAnnotation Rect](self, "Rect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  CGContextSetFillColorWithColor(a3, -[UIColor CGColor](+[UIColor yellowColor](UIColor, "yellowColor"), "CGColor"));
  v12.origin.x = v5;
  v12.origin.y = v7;
  v12.size.width = v9;
  v12.size.height = v11;
  CGContextFillRect(a3, v12);
}

@end
