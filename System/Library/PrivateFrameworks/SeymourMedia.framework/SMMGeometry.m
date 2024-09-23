@implementation SMMGeometry

+ (double)floorValue:(double)a3 toScaleOfView:(id)a4
{
  double result;

  UIFloorToViewScale();
  return result;
}

+ (double)floorValue:(double)a3 toScaleOfScreen:(id)a4
{
  double result;

  objc_msgSend(a4, "scale");
  UIFloorToScale();
  return result;
}

+ (double)roundValue:(double)a3 toScaleOfView:(id)a4
{
  double result;

  UIRoundToViewScale();
  return result;
}

+ (double)roundValue:(double)a3 toScaleOfScreen:(id)a4
{
  double result;

  UIRoundToScreenScale();
  return result;
}

+ (double)ceilValue:(double)a3 toScaleOfView:(id)a4
{
  double result;

  UICeilToViewScale();
  return result;
}

+ (double)ceilValue:(double)a3 toScaleOfScreen:(id)a4
{
  double result;

  objc_msgSend(a4, "scale");
  UICeilToScale();
  return result;
}

@end
