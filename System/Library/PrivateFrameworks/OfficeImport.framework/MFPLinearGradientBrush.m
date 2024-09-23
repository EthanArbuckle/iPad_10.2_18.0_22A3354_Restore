@implementation MFPLinearGradientBrush

- (void)setBounds:(CGRect)a3
{
  self->mBounds = a3;
}

- (void)setStartColor:(id)a3
{
  objc_storeStrong((id *)&self->mStartColor, a3);
}

- (void)setEndColor:(id)a3
{
  objc_storeStrong((id *)&self->mEndColor, a3);
}

- (id)startColor
{
  return self->mStartColor;
}

- (id)endColor
{
  return self->mEndColor;
}

- (void)createShading
{
  CGRect *p_mBounds;
  double MinX;
  double MinY;
  double MaxX;
  double v7;
  CGAffineTransform *p_mTransform;
  __int128 v9;
  double MidX;
  double MidY;
  double v12;
  double v13;
  double v14;
  CGFloat MaxY;
  CGFloat b;
  double c;
  double d;
  double tx;
  double ty;
  double v21;
  double v22;
  float v23;
  double v24;
  double v25;
  CGColorSpace *DeviceRGB;
  CGAffineTransform v27;
  CGPoint v28;
  CGPoint v29;

  p_mBounds = &self->mBounds;
  MinX = CGRectGetMinX(self->mBounds);
  MinY = CGRectGetMinY(*p_mBounds);
  MaxX = CGRectGetMaxX(*p_mBounds);
  v7 = CGRectGetMinY(*p_mBounds);
  p_mTransform = &self->super.mTransform;
  v9 = *(_OWORD *)&self->super.mTransform.c;
  *(_OWORD *)&v27.a = *(_OWORD *)&self->super.mTransform.a;
  *(_OWORD *)&v27.c = v9;
  *(_OWORD *)&v27.tx = *(_OWORD *)&self->super.mTransform.tx;
  if (!CGAffineTransformIsIdentity(&v27))
  {
    MidX = CGRectGetMidX(*p_mBounds);
    MidY = CGRectGetMidY(*p_mBounds);
    v12 = CGRectGetMinX(*p_mBounds);
    v13 = CGRectGetMinY(*p_mBounds);
    v14 = CGRectGetMinX(*p_mBounds);
    MaxY = CGRectGetMaxY(*p_mBounds);
    b = self->super.mTransform.b;
    c = self->super.mTransform.c;
    d = self->super.mTransform.d;
    tx = self->super.mTransform.tx;
    ty = self->super.mTransform.ty;
    v21 = tx + v13 * c + p_mTransform->a * v12;
    v22 = ty + v13 * d + b * v12;
    v23 = tx + MaxY * c + p_mTransform->a * v14 - v21;
    *(float *)&MaxY = ty + MaxY * d + b * v14 - v22;
    *(float *)&b = ((v22 - MidY) * (float)-v23 + *(float *)&MaxY * (v21 - MidX))
                 / ((float)-v23 * (float)-v23 + *(float *)&MaxY * *(float *)&MaxY);
    v24 = (float)(*(float *)&MaxY * *(float *)&b);
    MinX = MidX + v24;
    v25 = (float)-(float)(v23 * *(float *)&b);
    MinY = MidY + v25;
    MaxX = MidX - v24;
    v7 = MidY - v25;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v28.x = MinX;
  v28.y = MinY;
  v29.x = MaxX;
  v29.y = v7;
  self->super.mShading = CGShadingCreateAxial(DeviceRGB, v28, v29, self->super.mShadingFunction, 1, 1);
  CGColorSpaceRelease(DeviceRGB);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEndColor, 0);
  objc_storeStrong((id *)&self->mStartColor, 0);
}

@end
