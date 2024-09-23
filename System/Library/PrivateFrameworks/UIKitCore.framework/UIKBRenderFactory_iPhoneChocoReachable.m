@implementation UIKBRenderFactory_iPhoneChocoReachable

- (Class)_overlayFactoryClass
{
  return (Class)objc_opt_class();
}

- (double)variantWideShadowWeight
{
  return 20.0;
}

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 5.0;
  v3 = 2.0;
  v4 = 10.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end
