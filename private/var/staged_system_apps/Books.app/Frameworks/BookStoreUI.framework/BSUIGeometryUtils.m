@implementation BSUIGeometryUtils

+ (CGRect)centeredCGRectFromRect:(CGRect)result centerHorizontally:(BOOL)a4 centerVertically:(BOOL)a5 bounds:(CGRect)a6 scale:(double)a7
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v11;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a5;
  if (a4)
    a1 = (id)UIRectCenteredXInRectScale(a1, a2, (__n128)result.origin, *(__n128 *)&result.origin.y, (__n128)result.size, *(__n128 *)&result.size.height, (__n128)a6.origin, *(__n128 *)&a6.origin.y, (__n128)a6.size, *(__n128 *)&a6.size.height, a7);
  if (v11)
    UIRectCenteredYInRectScale(a1, a2, (__n128)result.origin, *(__n128 *)&result.origin.y, (__n128)result.size, *(__n128 *)&result.size.height, x, y, width, height, a7);
  return result;
}

@end
