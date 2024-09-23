@implementation TVCornerUtilities

+ (BOOL)radiiIsZero:(TVCornerRadii)a3
{
  return a3.topLeft < 2.22044605e-16
      && a3.topRight < 2.22044605e-16
      && a3.bottomLeft < 2.22044605e-16
      && a3.bottomRight < 2.22044605e-16;
}

+ (TVCornerRadii)radiiFromRadius:(double)a3
{
  TVCornerRadii result;

  result.bottomRight = a3;
  result.bottomLeft = a3;
  result.topRight = a3;
  result.topLeft = a3;
  return result;
}

+ (TVCornerRadii)flipCGOriginRadii:(TVCornerRadii)a3
{
  double topRight;
  double topLeft;
  double bottomLeft;
  double bottomRight;
  double v7;
  double v8;
  TVCornerRadii result;

  topRight = a3.topRight;
  topLeft = a3.topLeft;
  bottomLeft = a3.bottomLeft;
  bottomRight = a3.bottomRight;
  v7 = topLeft;
  v8 = topRight;
  result.bottomRight = v8;
  result.bottomLeft = v7;
  result.topRight = bottomRight;
  result.topLeft = bottomLeft;
  return result;
}

+ (double)radiusFromCornerRadii:(TVCornerRadii)a3
{
  return fmax(fmax(a3.topLeft, a3.topRight), fmax(a3.bottomLeft, a3.bottomRight));
}

+ (CGPath)createPathForRadii:(TVCornerRadii)a3 inRect:(CGRect)a4
{
  return (CGPath *)objc_msgSend((id)objc_opt_class(), "createPathForRadii:inRect:isContinuous:", 0, a3.topLeft, a3.topRight, a3.bottomLeft, a3.bottomRight, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (CGPath)createPathForRadii:(TVCornerRadii)a3 inRect:(CGRect)a4 isContinuous:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double topLeft;
  double MinX;
  double MinY;
  double MaxX;
  double MaxY;
  double v16;
  id v17;
  CGPath *v18;
  CGPath *Mutable;
  double radius;
  double bottomRight;
  double bottomLeft;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  bottomRight = a3.bottomRight;
  bottomLeft = a3.bottomLeft;
  radius = a3.topRight;
  topLeft = a3.topLeft;
  MinX = CGRectGetMinX(a4);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinY = CGRectGetMinY(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MaxX = CGRectGetMaxX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxY = CGRectGetMaxY(v26);
  if (v5)
  {
    objc_msgSend(a1, "radiusFromCornerRadii:", topLeft, radius, bottomLeft, bottomRight);
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", MinX, MinY, MaxX - MinX, MaxY - MinY, v16);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (CGPath *)MEMORY[0x22767EDD4](objc_msgSend(v17, "CGPath"));

    return v18;
  }
  else
  {
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, topLeft + MinX, MinY);
    CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, radius + MinY, radius);
    CGPathAddArcToPoint(Mutable, 0, MaxX, MaxY, MaxX - bottomRight, MaxY, bottomRight);
    CGPathAddArcToPoint(Mutable, 0, MinX, MaxY, MinX, MaxY - bottomLeft, bottomLeft);
    CGPathAddArcToPoint(Mutable, 0, MinX, MinY, topLeft + MinX, MinY, topLeft);
    return Mutable;
  }
}

@end
