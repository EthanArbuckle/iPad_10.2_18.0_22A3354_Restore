@implementation UIKBRenderFactoryiPadHWR_PortraitFudge

- (BOOL)_anchorControlKeys
{
  return 1;
}

- (UIEdgeInsets)symbolFrameInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 3.0;
  v3 = 3.0;
  v4 = 3.0;
  v5 = 3.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)_controlKeyOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 16.0);
  v4 = v3;
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:", 8.0);
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

@end
