@implementation UIKBRenderFactoryHWR_PortraitTruffle

- (CGPoint)moreKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)globeKeyTextOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = -0.3333;
  v3 = -0.3333;
  result.y = v3;
  result.x = v2;
  return result;
}

- (UIEdgeInsets)symbolFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 1.0;
  v3 = 2.0;
  v4 = 4.0;
  v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  return 20.0;
}

@end
