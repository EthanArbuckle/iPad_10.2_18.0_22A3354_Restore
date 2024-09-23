@implementation UIPDFSquareAnnotation

- (int)annotationType
{
  return 4;
}

- (void)strokePath:(CGContext *)a3 inRect:(CGRect)a4
{
  CGContextStrokeRect(a3, a4);
}

@end
