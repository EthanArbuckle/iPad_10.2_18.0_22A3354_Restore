@implementation FxTransform

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  FxDebugAssert(self->_priv != 0, CFSTR("_priv == NULL"), v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_priv);
  v9.receiver = self;
  v9.super_class = (Class)FxTransform;
  -[FxTransform dealloc](&v9, sel_dealloc);
}

- (FxTransform)initWithCGAffineTransform:(CGAffineTransform *)a3
{
  FxTransform *v4;
  FxTransformPriv *v5;
  __int128 v6;
  _OWORD v8[3];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FxTransform;
  v4 = -[FxTransform init](&v9, sel_init);
  if (v4)
  {
    v5 = (FxTransformPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x100004095CF6A33uLL);
    v4->_priv = v5;
    if (v5)
    {
      v6 = *(_OWORD *)&a3->c;
      v8[0] = *(_OWORD *)&a3->a;
      v8[1] = v6;
      v8[2] = *(_OWORD *)&a3->tx;
      -[FxTransform setCGAffineTransform:](v4, "setCGAffineTransform:", v8);
    }
  }
  return v4;
}

+ (id)identity
{
  id v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = objc_alloc((Class)objc_opt_class());
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return (id)objc_msgSend(v2, "initWithCGAffineTransform:", v5);
}

+ (id)transformWithCGAffineTransform:(CGAffineTransform *)a3
{
  id v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->tx;
  return (id)objc_msgSend(v4, "initWithCGAffineTransform:", v7);
}

- (FxTransform)initWithScale:(CGPoint)a3 rotate:(float)a4 translate:(CGPoint)a5 shear:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v11;
  CGFloat v12;
  FxTransform *v13;
  FxTransformPriv *v14;
  objc_super v16;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v11 = a3.y;
  v12 = a3.x;
  v16.receiver = self;
  v16.super_class = (Class)FxTransform;
  v13 = -[FxTransform init](&v16, sel_init);
  if (v13)
  {
    v14 = (FxTransformPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x100004095CF6A33uLL);
    v13->_priv = v14;
    if (v14)
    {
      v14->var0.x = v12;
      v14->var0.y = v11;
      v14->var1 = a4;
      v14->var2.x = v9;
      v14->var2.y = v8;
      v14->var3.x = x;
      v14->var3.y = y;
    }
  }
  return v13;
}

+ (id)transformWithScale:(CGPoint)a3 rotate:(float)a4 translate:(CGPoint)a5 shear:(CGPoint)a6
{
  double y;
  double x;
  double v8;
  double v9;
  double v11;
  double v12;
  id v13;
  double v14;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v11 = a3.y;
  v12 = a3.x;
  v13 = objc_alloc((Class)objc_opt_class());
  *(float *)&v14 = a4;
  return (id)objc_msgSend(v13, "initWithScale:rotate:translate:shear:", v12, v11, v14, v9, v8, x, y);
}

- (void)setScale:(CGPoint)a3
{
  self->_priv->var0 = a3;
}

- (CGPoint)scale
{
  FxTransformPriv *priv;
  double x;
  double y;
  CGPoint result;

  priv = self->_priv;
  x = priv->var0.x;
  y = priv->var0.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRotation:(float)a3
{
  self->_priv->var1 = a3;
}

- (float)rotation
{
  return self->_priv->var1;
}

- (void)setTranslation:(CGPoint)a3
{
  self->_priv->var2 = a3;
}

- (CGPoint)translation
{
  FxTransformPriv *priv;
  double x;
  double y;
  CGPoint result;

  priv = self->_priv;
  x = priv->var2.x;
  y = priv->var2.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setShear:(CGPoint)a3
{
  self->_priv->var3 = a3;
}

- (CGPoint)shear
{
  FxTransformPriv *priv;
  double x;
  double y;
  CGPoint result;

  priv = self->_priv;
  x = priv->var3.x;
  y = priv->var3.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCGAffineTransform:(CGAffineTransform *)a3
{
  FxTransformPriv *priv;
  double d;
  double b;
  double a;
  float v7;
  float v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double c;
  float v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;
  double v20;
  float v21;
  float v22;
  float v23;

  priv = self->_priv;
  priv->var2 = (CGPoint)vbicq_s8(*(int8x16_t *)&a3->tx, (int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x3E45798EE0000000uLL), vabsq_f64(*(float64x2_t *)&a3->tx)));
  d = a3->d;
  a = a3->a;
  b = a3->b;
  v7 = a3->a * d - d * b;
  if (fabsf(v7) >= 0.00000001)
  {
    v8 = sqrt(a * a + b * b);
    v9 = v8;
    if (v8 >= 0.00000001)
      v10 = v8;
    else
      v10 = 0.0;
    v11 = a / v9;
    v12 = b / v9;
    a3->a = v11;
    a3->b = v12;
    c = a3->c;
    v14 = d * v12 + v11 * c;
    v15 = c - v11 * v14;
    v16 = d - v12 * v14;
    v17 = sqrt(v15 * v15 + v16 * v16);
    v18 = v17;
    if (v17 >= 0.00000001)
      v19 = v17;
    else
      v19 = 0.0;
    v20 = v16 / v18;
    a3->c = v15 / v18;
    a3->d = v20;
    if (fabsf(v14 / v17) >= 0.00000001)
      v21 = v14 / v17;
    else
      v21 = 0.0;
    v22 = v11 * v20 - v12 * (v15 / v18);
    v23 = atan2(v12, v11);
    if (v23 < 0.0)
      v23 = v23 + 6.2832;
    if (v23 < 0.00000001)
      v23 = 0.0;
    if (v23 >= 3.1416)
    {
      v23 = v23 + -3.1416;
      if (v22 < 0.0)
        v10 = -v10;
    }
    else if (v22 < 0.0)
    {
      v19 = -v19;
    }
    priv->var0.x = v10;
    priv->var0.y = v19;
    priv->var1 = v23;
    priv->var3.x = v21;
    priv->var3.y = 0.0;
  }
  else
  {
    priv->var0.x = 0.0;
    priv->var0.y = 0.0;
    priv->var1 = 0.0;
    priv->var3.x = 0.0;
    priv->var3.y = 0.0;
  }
}

- (CGAffineTransform)cgAffineTransform
{
  FxTransformPriv *priv;
  int8x16_t var3;
  CGFloat y;
  __int128 v7;
  CGFloat var1;
  __int128 v9;
  __int128 v10;
  CGFloat x;
  __int128 v12;
  CGAffineTransform *result;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  priv = self->_priv;
  var3 = (int8x16_t)priv->var3;
  retstr->ty = 0.0;
  retstr->a = 1.0;
  *(int8x16_t *)&retstr->b = vextq_s8(var3, var3, 8uLL);
  retstr->d = 1.0;
  retstr->tx = 0.0;
  var3.i64[0] = *(_QWORD *)&priv->var0.x;
  y = priv->var0.y;
  v7 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v16.c = v7;
  *(_OWORD *)&v16.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(retstr, &v16, *(CGFloat *)var3.i64, y);
  var1 = priv->var1;
  v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.c = v9;
  *(_OWORD *)&v15.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformRotate(&v16, &v15, var1);
  v10 = *(_OWORD *)&v16.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v16.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v16.tx;
  x = priv->var2.x;
  *(CGFloat *)&v10 = priv->var2.y;
  v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.c = v12;
  *(_OWORD *)&v15.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformTranslate(&v16, &v15, x, *(CGFloat *)&v10);
  v14 = *(_OWORD *)&v16.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v16.a;
  *(_OWORD *)&retstr->c = v14;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v16.tx;
  return result;
}

@end
