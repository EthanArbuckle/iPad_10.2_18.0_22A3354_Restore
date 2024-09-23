@implementation TSWPPadding

- (double)leftInset
{
  return self->_leftInset;
}

- (double)topInset
{
  return self->_topInset;
}

+ (id)padding
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (TSWPPadding)init
{
  return -[TSWPPadding initWithTopInset:leftInset:bottomInset:rightInset:](self, "initWithTopInset:leftInset:bottomInset:rightInset:", 0.0, 0.0, 0.0, 0.0);
}

- (TSWPPadding)initWithTopInset:(double)a3 leftInset:(double)a4 bottomInset:(double)a5 rightInset:(double)a6
{
  char *v6;
  float64x2_t v7;
  double v8;
  void *v9;
  uint64_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TSWPPadding;
  v6 = -[TSWPPadding init](&v20, sel_init);
  if (v6)
  {
    v8 = a3;
    if (a3 > 50000000.0
      || (v7.f64[0] = a3, v8 = a4, a4 > 50000000.0)
      || (v8 = a5, a5 > 50000000.0)
      || (v8 = a6, a6 > 50000000.0))
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", 50000000.0, v8, v7.f64[0]);
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPPadding initWithTopInset:leftInset:bottomInset:rightInset:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPPadding.mm"), 68, CFSTR("Illegal huge padding value"));
      v7.f64[0] = a3;
    }
    v7.f64[1] = a4;
    v11 = vmaxnmq_f64(v7, (float64x2_t)0);
    v12 = (float64x2_t)vdupq_n_s64(0x4187D78400000000uLL);
    *(int8x16_t *)(v6 + 8) = vbslq_s8((int8x16_t)vcgtq_f64(v11, v12), (int8x16_t)v12, (int8x16_t)v11);
    v13.f64[0] = a5;
    v13.f64[1] = a6;
    v14 = vmaxnmq_f64(v13, (float64x2_t)0);
    *(int8x16_t *)(v6 + 24) = vbslq_s8((int8x16_t)vcgtq_f64(v14, v12), (int8x16_t)v12, (int8x16_t)v14);
  }
  return (TSWPPadding *)v6;
}

- (double)rightInset
{
  return self->_rightInset;
}

+ (TSWPPadding)paddingWithTopInset:(double)a3 leftInset:(double)a4 bottomInset:(double)a5 rightInset:(double)a6
{
  return (TSWPPadding *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithTopInset:leftInset:bottomInset:rightInset:", a3, a4, a5, a6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTopInset:leftInset:bottomInset:rightInset:", self->_topInset, self->_leftInset, self->_bottomInset, self->_rightInset);
}

- (void)transform:(CGAffineTransform *)a3
{
  double a;

  a = a3->a;
  if (a3->a >= a3->d)
    a = a3->d;
  *(float64x2_t *)&self->_topInset = vmulq_n_f64(*(float64x2_t *)&self->_topInset, a);
  *(float64x2_t *)&self->_bottomInset = vmulq_n_f64(*(float64x2_t *)&self->_bottomInset, a);
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && *((double *)a3 + 1) == self->_topInset
      && *((double *)a3 + 2) == self->_leftInset
      && *((double *)a3 + 3) == self->_bottomInset
      && *((double *)a3 + 4) == self->_rightInset;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@*)%p { topInset=%f; leftInset=%f; bottomInset=%f; rightInset=%f }"),
               NSStringFromClass(v4),
               self,
               *(_QWORD *)&self->_topInset,
               *(_QWORD *)&self->_leftInset,
               *(_QWORD *)&self->_bottomInset,
               *(_QWORD *)&self->_rightInset);
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (void)setLeftInset:(double)a3
{
  self->_leftInset = a3;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (void)setBottomInset:(double)a3
{
  self->_bottomInset = a3;
}

- (void)setRightInset:(double)a3
{
  self->_rightInset = a3;
}

@end
