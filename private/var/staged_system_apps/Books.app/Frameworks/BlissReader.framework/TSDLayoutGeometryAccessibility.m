@implementation TSDLayoutGeometryAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDLayoutGeometry");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (double)tsaxAngle
{
  double v2;
  double result;
  _OWORD v4[3];
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  v5 = 0u;
  if (self)
    -[TSDLayoutGeometryAccessibility tsaxCGAffineTransformValueForKey:](self, "tsaxCGAffineTransformValueForKey:", CFSTR("transform"));
  v4[0] = v5;
  v4[1] = v6;
  v4[2] = v7;
  v2 = TSDTransformAngle(v4, a2);
  TSDNormalizeAngleInDegrees(-v2);
  return result;
}

- (CGSize)tsaxSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[TSDLayoutGeometryAccessibility _tsaxFrame](self, "_tsaxFrame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGRect)_tsaxFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDLayoutGeometryAccessibility tsaxCGRectValueForKey:](self, "tsaxCGRectValueForKey:", CFSTR("frame"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end
