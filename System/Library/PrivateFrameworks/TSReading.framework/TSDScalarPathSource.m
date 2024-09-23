@implementation TSDScalarPathSource

+ (id)rectangleWithNaturalSize:(CGSize)a3
{
  return +[TSDScalarPathSource roundedRectangleWithScalar:naturalSize:](TSDScalarPathSource, "roundedRectangleWithScalar:naturalSize:", 0.0, a3.width, a3.height);
}

+ (id)roundedRectangleWithScalar:(double)a3 naturalSize:(CGSize)a4
{
  return -[TSDScalarPathSource initWithType:scalar:naturalSize:]([TSDScalarPathSource alloc], "initWithType:scalar:naturalSize:", 0, a3, a4.width, a4.height);
}

+ (id)regularPolygonWithScalar:(double)a3 naturalSize:(CGSize)a4
{
  return -[TSDScalarPathSource initWithType:scalar:naturalSize:]([TSDScalarPathSource alloc], "initWithType:scalar:naturalSize:", 1, a3, a4.width, a4.height);
}

+ (id)chevronWithScalar:(double)a3 naturalSize:(CGSize)a4
{
  return -[TSDScalarPathSource initWithType:scalar:naturalSize:]([TSDScalarPathSource alloc], "initWithType:scalar:naturalSize:", 2, a3, a4.width, a4.height);
}

+ (id)pathSourceWithType:(int)a3 scalar:(double)a4 naturalSize:(CGSize)a5
{
  return -[TSDScalarPathSource initWithType:scalar:naturalSize:]([TSDScalarPathSource alloc], "initWithType:scalar:naturalSize:", *(_QWORD *)&a3, a4, a5.width, a5.height);
}

- (TSDScalarPathSource)initWithType:(int)a3 scalar:(double)a4 naturalSize:(CGSize)a5
{
  double height;
  double width;
  uint64_t v8;
  TSDScalarPathSource *v9;
  TSDScalarPathSource *v10;
  objc_super v12;

  height = a5.height;
  width = a5.width;
  v8 = *(_QWORD *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)TSDScalarPathSource;
  v9 = -[TSDScalarPathSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[TSDScalarPathSource setType:](v9, "setType:", v8);
    -[TSDScalarPathSource setScalar:](v10, "setScalar:", a4);
    -[TSDScalarPathSource setNaturalSize:](v10, "setNaturalSize:", width, height);
  }
  return v10;
}

- (TSDScalarPathSource)init
{
  return -[TSDScalarPathSource initWithType:scalar:naturalSize:](self, "initWithType:scalar:naturalSize:", 0, 5.0, 100.0, 100.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDScalarPathSource;
  v4 = -[TSDPathSource copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setType:", -[TSDScalarPathSource type](self, "type"));
  -[TSDScalarPathSource scalar](self, "scalar");
  objc_msgSend(v4, "setScalar:");
  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  objc_msgSend(v4, "setNaturalSize:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (a3 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v22 = v6;
    v23 = v5;
    v24 = v3;
    v25 = v4;
    v21.receiver = self;
    v21.super_class = (Class)TSDScalarPathSource;
    v9 = -[TSDPathSource isEqual:](&v21, sel_isEqual_);
    if (v9)
    {
      v10 = -[TSDScalarPathSource type](self, "type");
      if (v10 == objc_msgSend(a3, "type")
        && (-[TSDScalarPathSource scalar](self, "scalar"),
            v12 = v11,
            objc_msgSend(a3, "scalar"),
            vabdd_f64(v12, v13) < 0.00999999978))
      {
        -[TSDScalarPathSource naturalSize](self, "naturalSize");
        v15 = v14;
        v17 = v16;
        objc_msgSend(a3, "naturalSize");
        LOBYTE(v9) = v17 == v19 && v15 == v18;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return v9;
}

- (unint64_t)hash
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return -[NSString hash](NSStringFromClass(v2), "hash");
}

- (id)description
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDScalarPathSource;
  v3 = (void *)objc_msgSend(-[TSDScalarPathSource description](&v5, sel_description), "mutableCopy");
  objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("; type=%d; scalar=%f; natural size=%@"),
      *(unsigned int *)(&self->super.mVerticalFlip + 3),
      *(_QWORD *)&self->mType,
      NSStringFromCGSize(*(CGSize *)&self->mScalar)));
  return v3;
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height;
  CGFloat width;
  double v6;

  height = a3.height;
  width = a3.width;
  if (!-[TSDScalarPathSource type](self, "type"))
  {
    -[TSDPathSource uniformScaleForScalingToNaturalSize:](self, "uniformScaleForScalingToNaturalSize:", width, height);
    *(double *)&self->mType = v6 * *(double *)&self->mType;
  }
  self->mScalar = width;
  self->mNaturalSize.width = height;
}

- (void)setScalarValue:(id)a3
{
  float v4;

  objc_msgSend(a3, "floatValue");
  -[TSDScalarPathSource setScalar:](self, "setScalar:", v4);
}

- (double)maxScalar
{
  int v3;
  double result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = -[TSDScalarPathSource type](self, "type");
  if (v3 == 2)
  {
    -[TSDScalarPathSource naturalSize](self, "naturalSize");
    return v11 / v12;
  }
  else if (v3 == 1)
  {
    return 100.0;
  }
  else
  {
    result = 0.0;
    if (!v3)
    {
      -[TSDScalarPathSource naturalSize](self, "naturalSize", 0.0);
      v6 = v5;
      v7 = *MEMORY[0x24BDBEFB0];
      v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v10 = TSDDistance(*MEMORY[0x24BDBEFB0], v8, 0.0, v9) * 0.5;
      result = TSDDistance(v7, v8, v6, 0.0) * 0.5;
      if (v10 < result)
        return v10;
    }
  }
  return result;
}

- (unint64_t)numberOfControlKnobs
{
  return 1;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  int v4;
  double v5;
  double v6;
  CGPoint result;

  v4 = -[TSDScalarPathSource type](self, "type", a3);
  if (v4 == 2)
  {
    -[TSDScalarPathSource p_getControlKnobPointForChevron](self, "p_getControlKnobPointForChevron");
  }
  else if (v4 == 1)
  {
    -[TSDScalarPathSource p_getControlKnobPointForRegularPolygon](self, "p_getControlKnobPointForRegularPolygon");
  }
  else if (v4)
  {
    v5 = *MEMORY[0x24BDBEFB0];
    v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  else
  {
    -[TSDScalarPathSource p_getControlKnobPointForRoundedRect](self, "p_getControlKnobPointForRoundedRect");
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y;
  double x;
  int v7;

  y = a4.y;
  x = a4.x;
  v7 = -[TSDScalarPathSource type](self, "type", a3);
  switch(v7)
  {
    case 2:
      -[TSDScalarPathSource p_setControlKnobPointForChevron:](self, "p_setControlKnobPointForChevron:", x, y);
      break;
    case 1:
      -[TSDScalarPathSource p_setControlKnobPointForRegularPolygon:](self, "p_setControlKnobPointForRegularPolygon:", x, y);
      break;
    case 0:
      -[TSDScalarPathSource p_setControlKnobPointForRoundedRect:](self, "p_setControlKnobPointForRoundedRect:", x, y);
      break;
  }
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  int v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  double v8;

  v4 = -[TSDScalarPathSource type](self, "type", a3);
  if (!v4)
  {
    v5 = CFSTR("Radius: %d pt");
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = CFSTR("Sides: %d");
LABEL_5:
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", v5, &stru_24D82FEB0, CFSTR("TSDrawables"));
    -[TSDScalarPathSource scalar](self, "scalar");
    return (id)objc_msgSend(v6, "stringWithFormat:", v7, (int)v8);
  }
  return &stru_24D82FEB0;
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGPath *Mutable;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGRect v17;

  if (-[TSDScalarPathSource type](self, "type", a3) != 1)
    return 0;
  objc_msgSend(-[TSDPathSource bezierPath](self, "bezierPath"), "bounds");
  v5 = v4;
  v7 = v6;
  Mutable = CGPathCreateMutable();
  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  v10 = -(v5 - v9 * 0.15);
  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  v12 = -(v7 - v11 * 0.15);
  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  v14 = v13 * 0.7;
  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  v17.size.height = v15 * 0.7;
  v17.origin.x = v10;
  v17.origin.y = v12;
  v17.size.width = v14;
  CGPathAddEllipseInRect(Mutable, 0, v17);
  return Mutable;
}

- (id)valueForSetSelector:(SEL)a3
{
  void *v4;
  double v5;
  objc_super v6;

  if (sel_setScalarValue_ == a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[TSDScalarPathSource scalar](self, "scalar");
    *(float *)&v5 = v5;
    return (id)objc_msgSend(v4, "numberWithFloat:", v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TSDScalarPathSource;
    return -[TSDPathSource valueForSetSelector:](&v6, sel_valueForSetSelector_);
  }
}

- (id)bezierPathWithoutFlips
{
  int v3;
  CGPath *v4;
  const CGPath *v5;
  TSDBezierPath *v6;

  v3 = -[TSDScalarPathSource type](self, "type");
  if (v3 == 2)
  {
    v4 = -[TSDScalarPathSource p_newChevronPath](self, "p_newChevronPath");
  }
  else if (v3 == 1)
  {
    v4 = -[TSDScalarPathSource p_newRegularPolygonPath](self, "p_newRegularPolygonPath");
  }
  else
  {
    if (v3)
    {
      v5 = 0;
      goto LABEL_9;
    }
    v4 = -[TSDScalarPathSource p_newRoundedRectPath](self, "p_newRoundedRectPath");
  }
  v5 = v4;
LABEL_9:
  v6 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v5);
  CGPathRelease(v5);
  return v6;
}

- (BOOL)isRectangular
{
  double v4;

  if (-[TSDScalarPathSource type](self, "type"))
    return 0;
  -[TSDScalarPathSource scalar](self, "scalar");
  return v4 == 0.0;
}

- (BOOL)isCircular
{
  return 0;
}

- (CGSize)scaleFactorForInscribedRectangle
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  CGSize result;

  v3 = 1.0;
  if (-[TSDScalarPathSource type](self, "type"))
  {
    v4 = 1.0;
  }
  else
  {
    -[TSDScalarPathSource naturalSize](self, "naturalSize");
    v6 = v5;
    v8 = v7;
    v9 = *MEMORY[0x24BDBEFB0];
    v10 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    -[TSDScalarPathSource scalar](self, "scalar");
    v12 = v11;
    v13 = TSDDistance(v9, v10, 0.0, v8) * 0.5;
    v14 = TSDDistance(v9, v10, v6, 0.0) * 0.5;
    if (v13 < v14)
      v14 = v13;
    if (v12 < v14)
      -[TSDScalarPathSource scalar](self, "scalar");
    v15 = v14;
    v4 = 1.0;
    if (v15 != 0.0)
    {
      v16 = (float)(v15 + v15);
      v3 = (v6 - v16) / v6;
      v4 = (v8 - v16) / v8;
    }
  }
  v17 = v3;
  result.height = v4;
  result.width = v17;
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__TSDScalarPathSource_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __44__TSDScalarPathSource_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDScalarPathSource mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDScalarPathSource.m"), 398, CFSTR("nil object after cast"));
  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "type");
  if (v5 != objc_msgSend(v2, "type"))
    return 1;
  objc_msgSend(*(id *)(a1 + 40), "naturalSize");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v2, "naturalSize");
  if (TSDNearlyEqualSizes(v7, v9, v10, v11))
  {
    objc_msgSend(*(id *)(a1 + 40), "scalar");
    v13 = v12;
    objc_msgSend(v2, "scalar");
    if (vabdd_f64(v13, v14) < 0.00999999978)
      return 4;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "type") != 1)
    return 3;
  objc_msgSend(*(id *)(a1 + 40), "scalar");
  v17 = v16;
  objc_msgSend(v2, "scalar");
  if (vabdd_f64(v17, v18) <= 2.0)
    return 2;
  else
    return 3;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__TSDScalarPathSource_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDScalarPathSource *__56__TSDScalarPathSource_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  objc_msgSend(*(id *)(a1 + 40), "scalar");
  objc_msgSend(v2, "scalar");
  TSUMix();
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "naturalSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v2, "naturalSize");
  v11 = TSDMixSizes(v6, v8, v9, v10, *(double *)(a1 + 48));
  return +[TSDScalarPathSource pathSourceWithType:scalar:naturalSize:](TSDScalarPathSource, "pathSourceWithType:scalar:naturalSize:", objc_msgSend(*(id *)(a1 + 40), "type"), v4, v11, v12);
}

- (CGPath)p_newRoundedRectPath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;

  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  v4 = v3;
  v6 = v5;
  v7 = *MEMORY[0x24BDBEFB0];
  v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[TSDScalarPathSource scalar](self, "scalar");
  v10 = v9;
  v11 = TSDDistance(v7, v8, 0.0, v6) * 0.5;
  v12 = TSDDistance(v7, v8, v4, 0.0) * 0.5;
  if (v11 < v12)
    v12 = v11;
  if (v10 < v12)
    -[TSDScalarPathSource scalar](self, "scalar");
  v13 = v12;
  v14 = TSDRectWithSize();
  return TSDCreateRoundRectPathForRectWithRadius(v14, v15, v16, v17, v13);
}

- (CGPath)p_newRegularPolygonPath
{
  CGPath *Mutable;
  double v4;
  int v5;
  double v6;
  double v7;
  float v8;
  double v9;
  double v10;
  int i;
  float v12;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform m;
  CGFloat v17;
  CGFloat v18;

  Mutable = CGPathCreateMutable();
  -[TSDScalarPathSource scalar](self, "scalar");
  if (v4 >= 3.0)
  {
    -[TSDScalarPathSource scalar](self, "scalar");
    v5 = (int)v6;
  }
  else
  {
    v5 = 3;
  }
  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  v8 = v7 * 0.5;
  v17 = 0.0;
  v18 = 0.0;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeScale(&m, 1.0, v9 / v7);
  v10 = v8;
  v14 = m;
  CGAffineTransformTranslate(&v15, &v14, v10, v10);
  m = v15;
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      v12 = 6.28318531 / (double)v5;
      TSDOriginRotate(&v17, v10, (float)(v12 * (float)i) + -1.57079633);
      if (i)
        CGPathAddLineToPoint(Mutable, &m, v17, v18);
      else
        CGPathMoveToPoint(Mutable, &m, v17, v18);
    }
  }
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)p_newChevronPath
{
  CGPath *Mutable;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGRect v15;

  Mutable = CGPathCreateMutable();
  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  v5 = v4;
  v7 = v6;
  -[TSDScalarPathSource scalar](self, "scalar");
  TSUClamp();
  v9 = v8;
  if (v9 == 0.0)
  {
    v15.origin.x = TSDRectWithSize();
    CGPathAddRect(Mutable, 0, v15);
  }
  else
  {
    v10 = *MEMORY[0x24BDBEFB0];
    v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v12 = v9;
    v13 = v5 - v9;
    CGPathMoveToPoint(Mutable, 0, *MEMORY[0x24BDBEFB0], v11);
    CGPathAddLineToPoint(Mutable, 0, v13, 0.0);
    CGPathAddLineToPoint(Mutable, 0, v5, v7 * 0.5);
    CGPathAddLineToPoint(Mutable, 0, v13, v7);
    CGPathAddLineToPoint(Mutable, 0, 0.0, v7);
    CGPathAddLineToPoint(Mutable, 0, v12, v7 * 0.5);
    CGPathAddLineToPoint(Mutable, 0, v10, v11);
    CGPathCloseSubpath(Mutable);
  }
  return Mutable;
}

- (void)p_setControlKnobPointForRoundedRect:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  v5 = v4;
  v6 = *MEMORY[0x24BDBEFB0];
  v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  TSDDistance(*MEMORY[0x24BDBEFB0], v7, 0.0, v8);
  TSDDistance(v6, v7, v5, 0.0);
  TSUClamp();
  -[TSDScalarPathSource setScalar:](self, "setScalar:");
}

- (CGPoint)p_getControlKnobPointForRoundedRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  v4 = v3;
  v6 = v5;
  v7 = *MEMORY[0x24BDBEFB0];
  v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[TSDScalarPathSource scalar](self, "scalar");
  TSDDistance(v7, v8, 0.0, v6);
  TSDDistance(v7, v8, v4, 0.0);
  TSUClamp();
  *(float *)&v9 = v9;
  v10 = *(float *)&v9;
  v11 = 0.0;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)p_setControlKnobPointForRegularPolygon:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;

  y = a3.y;
  x = a3.x;
  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  v7 = v6;
  v9 = v8;
  if (-[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip"))
    v10 = v9 - y;
  else
    v10 = y;
  v11 = x - v7 * 0.5;
  v12 = v7 / v9 * (v10 - v9 * 0.5);
  v13 = -v11;
  v14 = TSDPointLength(v11, v12);
  v15 = acos(v13 / v14);
  if (v12 > 0.0)
    v15 = 6.28318531 - v15;
  v16 = v15 / 6.28318531 + -0.25;
  if (v16 < 0.0)
    v16 = v16 + 1.0;
  if ((int)(v16 * 9.0 + 3.5) <= 11)
    v17 = (int)(v16 * 9.0 + 3.5);
  else
    v17 = 3;
  -[TSDScalarPathSource scalar](self, "scalar");
  if ((int)v18 != 3 || v17 == 4)
  {
    -[TSDScalarPathSource scalar](self, "scalar");
    if ((int)v19 != 11 || v17 == 10)
      -[TSDScalarPathSource setScalar:](self, "setScalar:", (double)v17);
  }
}

- (CGPoint)p_getControlKnobPointForRegularPolygon
{
  float v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  -[TSDScalarPathSource scalar](self, "scalar");
  v3 = 0.0;
  if (v4 >= 3.0)
  {
    -[TSDScalarPathSource scalar](self, "scalar");
    v3 = (float)((int)v5 - 3);
  }
  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  v7 = v6;
  v9 = v8;
  v10 = v6 * 0.5;
  v14 = 0.0;
  v15 = 0.0;
  TSDOriginRotate(&v14, v6 * 0.5 * 0.7, ((float)(v3 / 9.0) + -0.25) * 6.28318531);
  v14 = v10 + v14;
  v15 = v9 * 0.5 + v9 / v7 * v15;
  v11 = -[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v12 = v14;
  v13 = v15;
  if (v11)
    v13 = v9 - v15;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)p_setControlKnobPointForChevron:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;

  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  v5 = v4;
  TSUClamp();
  -[TSDScalarPathSource setScalar:](self, "setScalar:", v6 / v5);
}

- (CGPoint)p_getControlKnobPointForChevron
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[TSDScalarPathSource naturalSize](self, "naturalSize");
  v4 = v3;
  -[TSDScalarPathSource scalar](self, "scalar");
  TSUClamp();
  *(float *)&v5 = v5;
  v6 = *(float *)&v5;
  v7 = v4 * 0.5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (int)type
{
  return *(_DWORD *)(&self->super.mVerticalFlip + 3);
}

- (void)setType:(int)a3
{
  *(_DWORD *)(&self->super.mVerticalFlip + 3) = a3;
}

- (double)scalar
{
  return *(double *)&self->mType;
}

- (void)setScalar:(double)a3
{
  *(double *)&self->mType = a3;
}

- (CGSize)naturalSize
{
  double mScalar;
  double width;
  CGSize result;

  mScalar = self->mScalar;
  width = self->mNaturalSize.width;
  result.height = width;
  result.width = mScalar;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  *(CGSize *)&self->mScalar = a3;
}

@end
