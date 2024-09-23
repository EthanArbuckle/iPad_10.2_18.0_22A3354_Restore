@implementation OADOrientedBounds

- (OADOrientedBounds)initWithBounds:(CGRect)a3
{
  double v3;

  LODWORD(v3) = 0;
  return -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](self, "initWithBounds:rotation:flipX:flipY:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v3);
}

- (OADOrientedBounds)initWithBounds:(CGRect)a3 rotation:(float)a4 flipX:(BOOL)a5 flipY:(BOOL)a6
{
  _BOOL4 v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  OADOrientedBounds *result;
  char v14;
  objc_super v15;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)OADOrientedBounds;
  result = -[OADOrientedBounds init](&v15, sel_init);
  if (result)
  {
    result->mBounds.origin.x = x;
    result->mBounds.origin.y = y;
    result->mBounds.size.width = width;
    result->mBounds.size.height = height;
    result->mRotation = a4;
    if (v6)
      v14 = 2;
    else
      v14 = 0;
    *((_BYTE *)result + 44) = v14 | a5 | *((_BYTE *)result + 44) & 0xFC;
    *(_QWORD *)&result->mModeX = 0;
  }
  return result;
}

- (OADOrientedBounds)init
{
  double v2;

  LODWORD(v2) = 0;
  return -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](self, "initWithBounds:rotation:flipX:flipY:", 0, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), v2);
}

- (void)setRotation:(float)a3
{
  self->mRotation = a3;
}

- (void)setFlipX:(BOOL)a3
{
  *((_BYTE *)self + 44) = *((_BYTE *)self + 44) & 0xFE | a3;
}

- (void)setFlipY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 44) = *((_BYTE *)self + 44) & 0xFD | v3;
}

- (float)rotation
{
  return self->mRotation;
}

+ (BOOL)directionCloserToVerticalThanToHorizontal:(float)a3
{
  unsigned int v3;

  v3 = vcvts_n_s32_f32(a3, 0x10uLL);
  if ((v3 & 0x80000000) != 0)
    v3 += 23592960 * ((95443718 * (unint64_t)(-v3 >> 19)) >> 32) + 23592960;
  return ((95443718 * (unint64_t)((v3 + 2949120) >> 17)) >> 32) & 1;
}

- (void)setBounds:(CGRect)a3
{
  self->mBounds = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  float v14;
  float v15;
  float v16;
  int v17;
  int v18;
  int v19;
  int v20;
  BOOL v21;
  CGRect v23;
  CGRect v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    x = self->mBounds.origin.x;
    y = self->mBounds.origin.y;
    width = self->mBounds.size.width;
    height = self->mBounds.size.height;
    objc_msgSend(v5, "bounds");
    v24.origin.x = v10;
    v24.origin.y = v11;
    v24.size.width = v12;
    v24.size.height = v13;
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    if (CGRectEqualToRect(v23, v24)
      && (-[OADOrientedBounds rotation](self, "rotation"), v15 = v14, objc_msgSend(v5, "rotation"), v15 == v16)
      && (v17 = -[OADOrientedBounds flipX](self, "flipX"), v17 == objc_msgSend(v5, "flipX"))
      && (v18 = -[OADOrientedBounds flipY](self, "flipY"), v18 == objc_msgSend(v5, "flipY"))
      && (v19 = -[OADOrientedBounds xMode](self, "xMode"), v19 == objc_msgSend(v5, "xMode")))
    {
      v20 = -[OADOrientedBounds yMode](self, "yMode");
      v21 = v20 == objc_msgSend(v5, "yMode");
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mBounds.origin.x;
  y = self->mBounds.origin.y;
  width = self->mBounds.size.width;
  height = self->mBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

+ (OADOrientedBounds)orientedBoundsWithBounds:(CGRect)a3
{
  double v3;

  LODWORD(v3) = 0;
  return (OADOrientedBounds *)objc_msgSend(a1, "orientedBoundsWithBounds:rotation:flipX:flipY:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v3);
}

+ (OADOrientedBounds)orientedBoundsWithBounds:(CGRect)a3 rotation:(float)a4 flipX:(BOOL)a5 flipY:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  OADOrientedBounds *v13;
  double v14;

  v6 = a6;
  v7 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = [OADOrientedBounds alloc];
  *(float *)&v14 = a4;
  return -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v13, "initWithBounds:rotation:flipX:flipY:", v7, v6, x, y, width, height, v14);
}

- (BOOL)flipX
{
  return *((_BYTE *)self + 44) & 1;
}

- (BOOL)flipY
{
  return (*((unsigned __int8 *)self + 44) >> 1) & 1;
}

- (int)xMode
{
  return self->mModeX;
}

- (int)yMode
{
  return self->mModeY;
}

- (void)setXMode:(int)a3
{
  self->mModeX = a3;
}

- (void)setYMode:(int)a3
{
  self->mModeY = a3;
}

- (void)setOrientedBounds:(id)a3
{
  CGPoint v3;
  char v4;

  v3 = *(CGPoint *)((char *)a3 + 8);
  self->mBounds.size = *(CGSize *)((char *)a3 + 24);
  self->mBounds.origin = v3;
  self->mRotation = *((float *)a3 + 10);
  v4 = *((_BYTE *)self + 44) & 0xFE | *((_BYTE *)a3 + 44) & 1;
  *((_BYTE *)self + 44) = v4;
  *((_BYTE *)self + 44) = v4 & 0xFD | *((_BYTE *)a3 + 44) & 2;
  self->mModeX = *((_DWORD *)a3 + 12);
  self->mModeY = *((_DWORD *)a3 + 13);
}

- (CGSize)boundingBoxSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  float v8;
  __float2 v9;
  double v10;
  double v11;
  float v12;
  double v13;
  double v14;
  CGSize result;

  -[OADOrientedBounds bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[OADOrientedBounds rotation](self, "rotation");
  v8 = v7 * 3.14159265 / 180.0;
  v9 = __sincosf_stret(v8);
  v10 = fabsf(v9.__cosval);
  v11 = fabsf(v9.__sinval);
  v12 = v6 * v11 + v10 * v4;
  *(float *)&v10 = v4 * v11 + v10 * v6;
  v13 = v12;
  v14 = *(float *)&v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGRect)boundingBox
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  v3 = TSUCenterOfRect(self->mBounds.origin.x, self->mBounds.origin.y, self->mBounds.size.width, self->mBounds.size.height);
  v5 = v4;
  -[OADOrientedBounds boundingBoxSize](self, "boundingBoxSize");
  v7 = TSURectWithCenterAndSize(v3, v5, v6);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (BOOL)isEqualToOrientedBounds:(id)a3
{
  char *v4;
  float *v5;
  BOOL v6;

  v4 = (char *)a3;
  v5 = (float *)v4;
  v6 = v4
    && CGRectEqualToRect(self->mBounds, *(CGRect *)(v4 + 8))
    && self->mRotation == v5[10]
    && ((*((_BYTE *)v5 + 44) ^ *((_BYTE *)self + 44)) & 3) == 0
    && self->mModeX == *((_DWORD *)v5 + 12)
    && self->mModeY == *((_DWORD *)v5 + 13);

  return v6;
}

- (unint64_t)hash
{
  int8x16_t v2;

  v2 = veorq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->mBounds.origin), (int8x16_t)vcvtq_u64_f64((float64x2_t)self->mBounds.size));
  return *(unint64_t *)&veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL)) ^ *((_BYTE *)self + 44) & 1 ^ ((unint64_t)*((unsigned __int8 *)self + 44) >> 1) & 1 ^ (unint64_t)self->mRotation;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADOrientedBounds;
  -[OADOrientedBounds description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
