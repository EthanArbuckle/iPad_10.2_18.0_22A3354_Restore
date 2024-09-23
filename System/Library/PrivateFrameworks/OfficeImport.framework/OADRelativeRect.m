@implementation OADRelativeRect

- (OADRelativeRect)initWithLeft:(float)a3 top:(float)a4 right:(float)a5 bottom:(float)a6
{
  OADRelativeRect *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OADRelativeRect;
  result = -[OADRelativeRect init](&v11, sel_init);
  if (result)
  {
    result->mLeft = a3;
    result->mTop = a4;
    result->mRight = a5;
    result->mBottom = a6;
  }
  return result;
}

- (float)left
{
  return self->mLeft;
}

- (float)right
{
  return self->mRight;
}

- (float)top
{
  return self->mTop;
}

- (float)bottom
{
  return self->mBottom;
}

- (OADRelativeRect)init
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 0;
  LODWORD(v3) = 0;
  LODWORD(v4) = 0;
  LODWORD(v5) = 0;
  return -[OADRelativeRect initWithLeft:top:right:bottom:](self, "initWithLeft:top:right:bottom:", v2, v3, v4, v5);
}

- (void)setLeft:(float)a3
{
  self->mLeft = a3;
}

- (void)setRight:(float)a3
{
  self->mRight = a3;
}

- (void)setTop:(float)a3
{
  self->mTop = a3;
}

- (void)setBottom:(float)a3
{
  self->mBottom = a3;
}

- (unint64_t)hash
{
  int8x16_t v2;

  v2 = veorq_s8((int8x16_t)vcvtq_u64_f64(vcvtq_f64_f32(*(float32x2_t *)&self->mLeft)), (int8x16_t)vcvtq_u64_f64(vcvt_hight_f64_f32(*(float32x4_t *)&self->mLeft)));
  return (unint64_t)veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float mTop;
  float v6;
  float mBottom;
  float v8;
  float mLeft;
  float v10;
  float mRight;
  float v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (mTop = self->mTop, objc_msgSend(v4, "top"), mTop == v6)
    && (mBottom = self->mBottom, objc_msgSend(v4, "bottom"), mBottom == v8)
    && (mLeft = self->mLeft, objc_msgSend(v4, "left"), mLeft == v10))
  {
    mRight = self->mRight;
    objc_msgSend(v4, "right");
    v13 = mRight == v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)&v5 = self->mLeft;
  *(float *)&v6 = self->mTop;
  *(float *)&v7 = self->mRight;
  *(float *)&v8 = self->mBottom;
  return (id)objc_msgSend(v4, "initWithLeft:top:right:bottom:", v5, v6, v7, v8);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADRelativeRect;
  -[OADRelativeRect description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
