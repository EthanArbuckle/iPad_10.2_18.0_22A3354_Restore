@implementation TSDInfoGeometryAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDInfoGeometry");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (CGPoint)tsaxPosition
{
  double v2;
  double v3;
  CGPoint result;

  -[TSDInfoGeometryAccessibility tsaxCGPointValueForKey:](self, "tsaxCGPointValueForKey:", CFSTR("position"));
  result.y = v3;
  result.x = v2;
  return result;
}

- (int64_t)tsaxCompareToInfoGeometry:(id)a3
{
  double v5;
  double v6;
  int64_t result;
  double v8;
  double v9;
  double v10;

  -[TSDInfoGeometryAccessibility tsaxPosition](self, "tsaxPosition");
  v6 = v5;
  objc_msgSend(a3, "tsaxPosition");
  result = -[TSDInfoGeometryAccessibility _tsaxCompareCGFloat:toCGFloat:](self, "_tsaxCompareCGFloat:toCGFloat:", v6);
  if (!result)
  {
    -[TSDInfoGeometryAccessibility tsaxPosition](self, "tsaxPosition");
    v9 = v8;
    objc_msgSend(a3, "tsaxPosition");
    return -[TSDInfoGeometryAccessibility _tsaxCompareCGFloat:toCGFloat:](self, "_tsaxCompareCGFloat:toCGFloat:", v9, v10);
  }
  return result;
}

- (int64_t)_tsaxCompareCGFloat:(double)a3 toCGFloat:(double)a4
{
  if (a3 < a4)
    return -1;
  else
    return a3 != a4;
}

@end
