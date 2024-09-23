@implementation UIPDFCircleAnnotation

- (int)annotationType
{
  return 0;
}

- (void)strokePath:(CGContext *)a3 inRect:(CGRect)a4
{
  CGContextStrokeEllipseInRect(a3, a4);
}

@end
