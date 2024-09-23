@implementation UIBezierPath(PhotosUIFoundation)

+ (id)px_bezierPathWithRoundedRect:()PhotosUIFoundation topLeftCornerRadius:topRightCornerRadius:bottomLeftCornerRadius:bottomRightCornerRadius:
{
  double MaxX;
  double MaxY;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v26;
  CGRect v27;

  MaxX = CGRectGetMaxX(*(CGRect *)&a2);
  v27.origin.x = a2;
  v27.origin.y = a3;
  v27.size.width = a4;
  v27.size.height = a5;
  MaxY = CGRectGetMaxY(v27);
  v19 = MaxY - a9;
  v20 = MaxX - a9;
  v26 = a8;
  v21 = MaxY - a8;
  v22 = a6;
  objc_msgSend(a1, "bezierPath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "moveToPoint:", a6, 0.0);
  objc_msgSend(v23, "addLineToPoint:", MaxX - a7, 0.0);
  objc_msgSend(v23, "addQuadCurveToPoint:controlPoint:", MaxX, a7, MaxX, 0.0);
  if (v19 != a7)
    objc_msgSend(v23, "addLineToPoint:", MaxX, v19);
  objc_msgSend(v23, "addQuadCurveToPoint:controlPoint:", v20, MaxY, MaxX, MaxY, *(_QWORD *)&a6);
  objc_msgSend(v23, "addLineToPoint:", v26, MaxY);
  objc_msgSend(v23, "addQuadCurveToPoint:controlPoint:", 0.0, v21, 0.0, MaxY);
  if (v21 != v22)
    objc_msgSend(v23, "addLineToPoint:", 0.0, v22);
  objc_msgSend(v23, "addQuadCurveToPoint:controlPoint:", v22, 0.0, 0.0, 0.0);
  objc_msgSend(v23, "setLineJoinStyle:", 1);
  return v23;
}

+ (id)px_bezierPathWithRoundedRect:()PhotosUIFoundation cornerRadius:continuousCorners:
{
  if (a3)
    objc_msgSend(a1, "_bezierPathWithPillRect:cornerRadius:");
  else
    objc_msgSend(a1, "_bezierPathWithArcRoundedRect:cornerRadius:");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
