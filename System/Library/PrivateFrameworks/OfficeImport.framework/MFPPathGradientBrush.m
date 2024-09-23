@implementation MFPPathGradientBrush

- (void)setCenterColor:(id)a3
{
  objc_storeStrong((id *)&self->mCenterColor, a3);
}

- (void)setCenterPoint:(CGPoint)a3
{
  self->mCenterPoint = a3;
}

- (void)setSurroundColors:(id)a3
{
  objc_storeStrong((id *)&self->mSurroundColors, a3);
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->mPath, a3);
}

- (void)createShading
{
  CGFloat x;
  CGFloat y;
  long double width;
  long double height;
  CGFloat MidX;
  CGFloat MidY;
  CGColorSpace *DeviceRGB;
  CGPoint v10;
  CGRect v11;
  CGRect v12;

  -[OITSUBezierPath bounds](self->mPath, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  MidY = CGRectGetMidY(v12);
  *(float *)&y = hypot(width, height) * 0.5;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v10.x = MidX;
  v10.y = MidY;
  self->super.mShading = CGShadingCreateRadial(DeviceRGB, self->mCenterPoint, 0.0, v10, *(float *)&y, self->super.mShadingFunction, 1, 1);
  CGColorSpaceRelease(DeviceRGB);
}

- (id)startColor
{
  return self->mCenterColor;
}

- (id)endColor
{
  return -[NSArray objectAtIndex:](self->mSurroundColors, "objectAtIndex:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPath, 0);
  objc_storeStrong((id *)&self->mSurroundColors, 0);
  objc_storeStrong((id *)&self->mCenterColor, 0);
}

@end
