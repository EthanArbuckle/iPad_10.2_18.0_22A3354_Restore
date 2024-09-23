@implementation UIKBRenderFactory10Key_Portrait

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 18.0;
  v3 = 6.0;
  v4 = 28.0;
  v5 = 6.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)multitapCompleteKeyImageName
{
  return CFSTR("kana_multitap_complete_arrow.png");
}

- (id)muttitapReverseKeyImageName
{
  return CFSTR("kana_multitap_reverse_arrow.png");
}

- (CGPoint)globeKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)controlColumnWidthFactor
{
  return 0.25;
}

- (void)setupLayoutSegments
{
  -[UIKBRenderFactory10Key_Portrait controlColumnWidthFactor](self, "controlColumnWidthFactor");
  -[UIKBRenderFactory10Key setupColumnLayoutSegmentsWithControlWidth:](self, "setupColumnLayoutSegmentsWithControlWidth:");
}

@end
