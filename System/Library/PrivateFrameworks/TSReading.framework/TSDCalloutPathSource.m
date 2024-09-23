@implementation TSDCalloutPathSource

- (TSDCalloutPathSource)initWithCornerRadius:(double)a3 tailPosition:(CGPoint)a4 tailSize:(double)a5 naturalSize:(CGSize)a6 tailAtCenter:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  TSDCalloutPathSource *v14;
  TSDCalloutPathSource *v15;
  objc_super v17;

  v7 = a7;
  height = a6.height;
  width = a6.width;
  y = a4.y;
  x = a4.x;
  v17.receiver = self;
  v17.super_class = (Class)TSDCalloutPathSource;
  v14 = -[TSDCalloutPathSource init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[TSDCalloutPathSource p_setNaturalSize:](v14, "p_setNaturalSize:", width, height);
    -[TSDCalloutPathSource p_setCornerRadius:](v15, "p_setCornerRadius:", a3);
    -[TSDCalloutPathSource p_setTailPosition:](v15, "p_setTailPosition:", x, y);
    -[TSDCalloutPathSource p_setTailSize:](v15, "p_setTailSize:", a5);
    -[TSDCalloutPathSource p_setTailAtCenter:](v15, "p_setTailAtCenter:", v7);
  }
  return v15;
}

- (TSDCalloutPathSource)init
{
  return -[TSDCalloutPathSource initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:](self, "initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:", 0, 10.0, -50.0, 50.0, 10.0, 100.0, 100.0);
}

+ (id)calloutWithCornerRadius:(double)a3 tailPosition:(CGPoint)a4 tailSize:(double)a5 naturalSize:(CGSize)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:", 0, a3, a4.x, a4.y, a5, a6.width, a6.height);
}

+ (id)quoteBubbleWithTailPosition:(CGPoint)a3 tailSize:(double)a4 naturalSize:(CGSize)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:", 1, a5.width + 10.0, a3.x, a3.y, a4, a5.width, a5.height);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDCalloutPathSource;
  v4 = -[TSDPathSource copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "p_setNaturalSize:", self->mNaturalSize.width, self->mNaturalSize.height);
  objc_msgSend(v4, "p_setCornerRadius:", self->mCornerRadius);
  objc_msgSend(v4, "p_setTailPosition:", self->mTailPosition.x, self->mTailPosition.y);
  objc_msgSend(v4, "p_setTailSize:", self->mTailSize);
  objc_msgSend(v4, "p_setTailAtCenter:", self->mIsTailAtCenter);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v9;
  double v10;
  double v11;
  double mCornerRadius;
  double v13;
  double v14;
  double v15;
  double mTailSize;
  double v17;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a3 == self)
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  v20 = v6;
  v21 = v5;
  v22 = v3;
  v23 = v4;
  v19.receiver = self;
  v19.super_class = (Class)TSDCalloutPathSource;
  v9 = -[TSDPathSource isEqual:](&v19, sel_isEqual_);
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;
    objc_msgSend(a3, "naturalSize");
    v9 = TSDNearlyEqualSizes(self->mNaturalSize.width, self->mNaturalSize.height, v10, v11);
    if (!v9)
      return v9;
    mCornerRadius = self->mCornerRadius;
    objc_msgSend(a3, "cornerRadius");
    if (vabdd_f64(mCornerRadius, v13) >= 0.00999999978)
    {
LABEL_9:
      LOBYTE(v9) = 0;
      return v9;
    }
    objc_msgSend(a3, "p_tailPosition");
    v9 = TSDNearlyEqualPoints(self->mTailPosition.x, self->mTailPosition.y, v14, v15);
    if (v9)
    {
      mTailSize = self->mTailSize;
      objc_msgSend(a3, "tailSize");
      LOBYTE(v9) = vabdd_f64(mTailSize, v17) < 0.00999999978;
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
  double mCornerRadius;
  void *v5;
  NSString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDCalloutPathSource;
  v3 = (void *)objc_msgSend(-[TSDCalloutPathSource description](&v8, sel_description), "mutableCopy");
  mCornerRadius = self->mCornerRadius;
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = NSStringFromCGPoint(self->mTailPosition);
  objc_msgSend(v3, "appendString:", objc_msgSend(v5, "stringWithFormat:", CFSTR("; corner radius=%f; tail position=%@, tail size=%f natural size=%@"),
      *(_QWORD *)&mCornerRadius,
      v6,
      *(_QWORD *)&self->mTailSize,
      NSStringFromCGSize(self->mNaturalSize)));
  return v3;
}

- (unint64_t)numberOfControlKnobs
{
  return 3;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  switch(a3)
  {
    case 0xEuLL:
      -[TSDCalloutPathSource tailSizeKnobPosition](self, "tailSizeKnobPosition");
      break;
    case 0xDuLL:
      -[TSDCalloutPathSource p_getControlKnobPointForRoundedRect](self, "p_getControlKnobPointForRoundedRect");
      break;
    case 0xCuLL:
      -[TSDCalloutPathSource tailKnobPosition](self, "tailKnobPosition");
      break;
    default:
      v3 = *MEMORY[0x24BDBEFB0];
      v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      break;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  switch(a3)
  {
    case 0xEuLL:
      -[TSDCalloutPathSource setTailSizeKnobPosition:](self, "setTailSizeKnobPosition:", a4.x, a4.y);
      break;
    case 0xDuLL:
      -[TSDCalloutPathSource p_setControlKnobPointForRoundedRect:](self, "p_setControlKnobPointForRoundedRect:", a4.x, a4.y);
      break;
    case 0xCuLL:
      -[TSDCalloutPathSource setTailKnobPosition:](self, "setTailKnobPosition:", a4.x, a4.y);
      break;
  }
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;

  if (a3 != 13)
    return &stru_24D82FEB0;
  -[TSDCalloutPathSource cornerRadius](self, "cornerRadius");
  v5 = v4;
  -[TSDCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
  if (v5 >= v6)
    return (id)objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("Oval"), &stru_24D82FEB0, CFSTR("TSDrawables"));
  else
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("Radius: %d pt"), &stru_24D82FEB0, CFSTR("TSDrawables")), (int)self->mCornerRadius);
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  return 0;
}

- (void)setCornerRadius:(double)a3
{
  double mCornerRadius;
  double v5;
  double v6;
  double v7;

  -[TSDCalloutPathSource p_setCornerRadius:](self, "p_setCornerRadius:", a3);
  mCornerRadius = self->mCornerRadius;
  v5 = 0.0;
  if (mCornerRadius >= 0.0)
  {
    -[TSDCalloutPathSource maxCornerRadius](self, "maxCornerRadius", 0.0);
    if (mCornerRadius < v6)
      return;
    -[TSDCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
    v5 = v7 + 1.0;
  }
  self->mCornerRadius = v5;
}

- (BOOL)isOval
{
  double mCornerRadius;
  double v3;

  mCornerRadius = self->mCornerRadius;
  -[TSDCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
  return mCornerRadius >= v3;
}

- (double)cornerRadius
{
  return self->mCornerRadius;
}

- (double)maxCornerRadius
{
  return fmin(self->mNaturalSize.height, self->mNaturalSize.width) * 0.5;
}

- (void)setTailSize:(double)a3
{
  CGFloat height;
  double mTailSize;

  -[TSDCalloutPathSource p_setTailSize:](self, "p_setTailSize:", a3);
  height = self->mNaturalSize.height;
  if (height <= self->mNaturalSize.width)
    height = self->mNaturalSize.width;
  mTailSize = self->mTailSize;
  if (mTailSize > height || (height = -height, mTailSize < height))
    self->mTailSize = height;
}

- (double)tailSize
{
  return self->mTailSize;
}

- (CGPoint)tailSizeKnobPosition
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
  double v15;
  uint64_t v16;
  CGPoint result;

  v16 = *MEMORY[0x24BDAC8D0];
  -[TSDCalloutPathSource naturalSize](self, "naturalSize");
  v4 = v3;
  v6 = v5;
  -[TSDCalloutPathSource p_getTailPath:center:tailSize:intersections:](self, "p_getTailPath:center:tailSize:intersections:", -[TSDCalloutPathSource p_basePath](self, "p_basePath"), 0, 0, &v12);
  if (v12 + v13 >= v14 + v15)
    v7 = v15;
  else
    v7 = v13;
  if (v12 + v13 >= v14 + v15)
    v8 = v14;
  else
    v8 = v12;
  if (-[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip"))
    v9 = v4 - v8;
  else
    v9 = v8;
  if (-[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip"))
    v10 = v6 - v7;
  else
    v10 = v7;
  v11 = v9;
  result.y = v10;
  result.x = v11;
  return result;
}

- (double)maxTailSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t i;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v27;
  double v28;
  float64x2_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34[5];

  v34[4] = *(double *)MEMORY[0x24BDAC8D0];
  -[TSDCalloutPathSource p_tailPosition](self, "p_tailPosition");
  v4 = v3;
  v6 = v5;
  v7 = -[TSDCalloutPathSource p_basePath](self, "p_basePath");
  -[TSDCalloutPathSource p_adjustedCenterForPath:](self, "p_adjustedCenterForPath:", v7);
  v9 = v8;
  v11 = v10;
  v12 = TSDDistance(v4, v6, v8, v10);
  v34[0] = v4;
  v34[1] = v6;
  v34[2] = v9;
  v34[3] = v11;
  v27 = 0.0;
  v28 = 0.0;
  v13 = objc_msgSend(v7, "elementCount");
  if (v13 < 1)
  {
    v24 = 0.0;
    v25 = 0.0;
    return fmin(v25, -v24) * 0.899999976;
  }
  v14 = v13;
  v15 = TSDSubtractPoints(v9, v11, v4);
  v17 = TSDNormalizePoint(v15, v16);
  v19 = v18;
  for (i = 0; i != v14; ++i)
  {
    v21 = objc_msgSend(v7, "elementAtIndex:allPoints:", i, &v29);
    if (v21 == 2)
    {
      p_getMaxMinTailSize(v34, &v28, &v27, v29.f64[0], v29.f64[1], v17, v19, v4, v6, v12);
      p_getMaxMinTailSize(v34, &v28, &v27, v32, v33, v17, v19, v4, v6, v12);
      v22 = TSDPointOnCurve(&v29, 0.5);
    }
    else
    {
      if (v21 != 1)
        continue;
      p_getMaxMinTailSize(v34, &v28, &v27, v29.f64[0], v29.f64[1], v17, v19, v4, v6, v12);
      v22 = v30;
      v23 = v31;
    }
    p_getMaxMinTailSize(v34, &v28, &v27, v22, v23, v17, v19, v4, v6, v12);
  }
  v24 = v27;
  v25 = v28;
  return fmin(v25, -v24) * 0.899999976;
}

- (void)setTailSizeKnobPosition:(CGPoint)a3
{
  double x;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _BYTE v30[32];
  uint64_t v31;

  x = a3.x;
  v31 = *MEMORY[0x24BDAC8D0];
  -[TSDCalloutPathSource naturalSize](self, "naturalSize");
  v6 = v5;
  if (-[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip"))
    x = v6 - x;
  -[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v28 = 0.0;
  v29 = 0.0;
  -[TSDCalloutPathSource p_getTailPath:center:tailSize:intersections:](self, "p_getTailPath:center:tailSize:intersections:", -[TSDCalloutPathSource p_basePath](self, "p_basePath"), &v28, 0, v30);
  -[TSDCalloutPathSource p_tailPosition](self, "p_tailPosition");
  v8 = v7;
  v10 = v9;
  v11 = TSDSubtractPoints(v7, v9, x);
  v13 = TSDNormalizePoint(v11, v12);
  v15 = v14;
  v16 = v28;
  v17 = v29;
  v18 = TSDSubtractPoints(v8, v10, v28);
  v20 = TSDNormalizePoint(v18, v19);
  v22 = v21;
  v27 = TSDDotPoints(v13, v15, v20, v21);
  v23 = TSDRotatePoint90Degrees(1, v20, v22);
  v25 = fabs(TSDDotPoints(v13, v15, v23, v24));
  v26 = v25 * (TSDDistance(v8, v10, v16, v17) / v27);
  if (fabs(v26) < 1.0)
    v26 = 1.0;
  self->mTailSize = v26;
}

- (void)setTailKnobPosition:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  -[TSDCalloutPathSource naturalSize](self, "naturalSize");
  v7 = v6;
  v9 = v8;
  if (-[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip"))
    x = v7 - x;
  if (-[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip"))
    v10 = v9 - y;
  else
    v10 = y;
  -[TSDCalloutPathSource p_setTailPosition:](self, "p_setTailPosition:", TSDMultiplyPointScalar(x, v10, 1.0));
}

- (CGPoint)tailKnobPosition
{
  double x;
  double y;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  x = self->mTailPosition.x;
  y = self->mTailPosition.y;
  -[TSDCalloutPathSource naturalSize](self, "naturalSize");
  v6 = v5;
  v8 = v7;
  if (-[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip"))
    v9 = v6 - x;
  else
    v9 = x;
  if (-[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip"))
    v10 = v8 - y;
  else
    v10 = y;
  v11 = v9;
  result.y = v10;
  result.x = v11;
  return result;
}

- (id)valueForSetSelector:(SEL)a3
{
  void *v4;
  double v5;
  void *v6;
  objc_super v7;

  if (sel_setCornerRadiusValue_ == a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[TSDCalloutPathSource cornerRadius](self, "cornerRadius");
    goto LABEL_9;
  }
  if (sel_setTailPositionValue_ != a3)
  {
    if (sel_setTailSizeValue_ != a3)
    {
      if (sel_setTailSizeKnobPosition_ != a3)
      {
        v7.receiver = self;
        v7.super_class = (Class)TSDCalloutPathSource;
        return -[TSDPathSource valueForSetSelector:](&v7, sel_valueForSetSelector_);
      }
      v6 = (void *)MEMORY[0x24BDD16E0];
      -[TSDCalloutPathSource tailSizeKnobPosition](self, "tailSizeKnobPosition");
      return (id)objc_msgSend(v6, "valueWithCGPoint:");
    }
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[TSDCalloutPathSource tailSize](self, "tailSize");
LABEL_9:
    *(float *)&v5 = v5;
    return (id)objc_msgSend(v4, "numberWithFloat:", v5);
  }
  v6 = (void *)MEMORY[0x24BDD1968];
  -[TSDCalloutPathSource tailKnobPosition](self, "tailKnobPosition");
  return (id)objc_msgSend(v6, "valueWithCGPoint:");
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  CGPoint *p_mTailPosition;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;

  height = a3.height;
  width = a3.width;
  -[TSDPathSource uniformScaleForScalingToNaturalSize:](self, "uniformScaleForScalingToNaturalSize:");
  v7 = v6;
  -[TSDCalloutPathSource naturalSize](self, "naturalSize");
  v9 = v8;
  v10 = -[TSDCalloutPathSource isOval](self, "isOval");
  p_mTailPosition = &self->mTailPosition;
  v12 = *MEMORY[0x24BDBEFB0];
  if (self->mTailPosition.x > v9 * 0.5)
  {
    v13 = width / v9 + -1.0;
    if (fabs(v13) > 0.001)
      v12 = (width - v9) * ((width / v9 - v7) / v13);
  }
  self->mTailSize = v7 * self->mTailSize;
  v14 = TSDMultiplyPointScalar(p_mTailPosition->x, self->mTailPosition.y, v7);
  p_mTailPosition->x = TSDAddPoints(v14, v15, v12);
  self->mTailPosition.y = v16;
  -[TSDCalloutPathSource p_setNaturalSize:](self, "p_setNaturalSize:", width, height);
  -[TSDCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
  if (v10)
    v18 = v17 + 1.0;
  else
    v18 = fmin(v17 + -0.001, v7 * self->mCornerRadius);
  self->mCornerRadius = v18;
}

- (CGSize)naturalSize
{
  double width;
  double height;
  CGSize result;

  width = self->mNaturalSize.width;
  height = self->mNaturalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGPoint)tailCenter
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  CGPoint result;

  if (self->mIsTailAtCenter)
  {
    v3 = self->mNaturalSize.width * 0.5;
    v4 = self->mNaturalSize.height * 0.5;
  }
  else
  {
    -[TSDCalloutPathSource p_tailPosition](self, "p_tailPosition");
    v3 = v6;
    v8 = v7;
    -[TSDCalloutPathSource cornerRadius](self, "cornerRadius");
    v4 = v9;
    if (v3 <= v9 || v3 >= self->mNaturalSize.width - v9)
    {
      if (v8 <= v9 || v8 >= self->mNaturalSize.height - v9)
      {
        v10 = v3 > v9;
        v3 = v9;
        if (v10)
          v3 = self->mNaturalSize.width - v9;
        if (v8 > v9)
          v4 = self->mNaturalSize.height - v9;
      }
      else
      {
        v3 = self->mNaturalSize.width * 0.5;
        v4 = v8;
      }
    }
    else
    {
      v4 = self->mNaturalSize.height * 0.5;
    }
  }
  v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- (BOOL)isTailAtCenter
{
  return self->mIsTailAtCenter;
}

- (BOOL)isRectangular
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__TSDCalloutPathSource_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __45__TSDCalloutPathSource_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 *v5;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  objc_opt_class();
  v2 = (unsigned __int8 *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCalloutPathSource mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCalloutPathSource.m"), 498, CFSTR("nil object after cast"));
  }
  v5 = *(unsigned __int8 **)(a1 + 40);
  if (v5[64] != v2[64])
    return 1;
  objc_msgSend(v5, "naturalSize");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v2, "naturalSize");
  if (!TSDNearlyEqualSizes(v7, v9, v10, v11))
    return 3;
  objc_msgSend(*(id *)(a1 + 40), "p_tailPosition");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v2, "p_tailPosition");
  if (!TSDNearlyEqualPoints(v13, v15, v16, v17))
    return 3;
  objc_msgSend(*(id *)(a1 + 40), "cornerRadius");
  v19 = v18;
  objc_msgSend(v2, "cornerRadius");
  if (vabdd_f64(v19, v20) < 0.00999999978
    && (objc_msgSend(*(id *)(a1 + 40), "tailSize"),
        v22 = v21,
        objc_msgSend(v2, "tailSize"),
        vabdd_f64(v22, v23) < 0.00999999978))
  {
    return 4;
  }
  else
  {
    return 3;
  }
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__TSDCalloutPathSource_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDCalloutPathSource *__57__TSDCalloutPathSource_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  TSDCalloutPathSource *v3;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  v3 = [TSDCalloutPathSource alloc];
  objc_msgSend(*(id *)(a1 + 40), "cornerRadius");
  objc_msgSend(v2, "cornerRadius");
  TSUMix();
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "p_tailPosition");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v2, "p_tailPosition");
  v12 = TSDMixPoints(v7, v9, v10, v11, *(double *)(a1 + 48));
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 40), "tailSize");
  objc_msgSend(v2, "tailSize");
  TSUMix();
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 40), "naturalSize");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v2, "naturalSize");
  v23 = TSDMixSizes(v18, v20, v21, v22, *(double *)(a1 + 48));
  return -[TSDCalloutPathSource initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:](v3, "initWithCornerRadius:tailPosition:tailSize:naturalSize:tailAtCenter:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 64), v5, v12, v14, v16, v23, v24);
}

- (void)p_setCornerRadius:(double)a3
{
  self->mCornerRadius = a3;
}

- (void)p_setTailPosition:(CGPoint)a3
{
  self->mTailPosition = a3;
}

- (CGPoint)p_tailPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->mTailPosition.x;
  y = self->mTailPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)p_setTailSize:(double)a3
{
  self->mTailSize = a3;
}

- (void)p_setNaturalSize:(CGSize)a3
{
  self->mNaturalSize = a3;
}

- (void)p_setTailAtCenter:(BOOL)a3
{
  self->mIsTailAtCenter = a3;
}

- (CGPoint)p_adjustedCenterForPath:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[5];
  CGPoint result;

  v16[4] = *MEMORY[0x24BDAC8D0];
  -[TSDCalloutPathSource tailCenter](self, "tailCenter");
  v6 = v5;
  v8 = v7;
  -[TSDCalloutPathSource p_tailPosition](self, "p_tailPosition");
  v16[0] = v9;
  v16[1] = v10;
  *(double *)&v16[2] = v6;
  *(double *)&v16[3] = v8;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a3, "addIntersectionsWithLine:to:", v16, v11);
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend((id)objc_msgSend(v11, "lastObject"), "point");
    v6 = v12;
    v8 = v13;
  }

  v14 = v6;
  v15 = v8;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)p_getTailPath:(id)a3 center:(CGPoint *)a4 tailSize:(double *)a5 intersections:(CGPoint)a6[2]
{
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  BOOL v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  CGFloat v80;
  CGFloat v81;
  double v82;
  double v83;
  double v84;
  CGFloat v85;
  double v86[4];
  double v87[5];

  v87[4] = *(double *)MEMORY[0x24BDAC8D0];
  -[TSDCalloutPathSource tailSize](self, "tailSize");
  v12 = v11;
  -[TSDCalloutPathSource p_tailPosition](self, "p_tailPosition");
  v14 = v13;
  v16 = v15;
  -[TSDCalloutPathSource p_adjustedCenterForPath:](self, "p_adjustedCenterForPath:", a3);
  v18 = v17;
  v20 = v19;
  -[TSDCalloutPathSource maxTailSize](self, "maxTailSize");
  v22 = fmin(fabs(v12), v21);
  v23 = TSDSubtractPoints(v14, v16, v18);
  v25 = TSDNormalizePoint(v23, v24);
  v84 = v22;
  v27 = TSDMultiplyPointScalar(v25, v26, v22);
  v29 = TSDRotatePoint90Degrees(1, v27, v28);
  v87[0] = v14;
  v87[1] = v16;
  v30 = TSDAddPoints(v18, v20, v29);
  v32 = TSDSubtractPoints(v30, v31, v14);
  v34 = TSDMultiplyPointScalar(v32, v33, 20.0);
  v87[2] = TSDAddPoints(v14, v16, v34);
  v87[3] = v35;
  v86[0] = v14;
  v86[1] = v16;
  v85 = v20;
  v36 = TSDSubtractPoints(v18, v20, v29);
  v38 = TSDSubtractPoints(v36, v37, v14);
  v40 = TSDMultiplyPointScalar(v38, v39, 20.0);
  v86[2] = TSDAddPoints(v14, v16, v40);
  v86[3] = v41;
  v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v43 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a3, "addIntersectionsWithLine:to:", v87, v42);
  objc_msgSend(a3, "addIntersectionsWithLine:to:", v86, v43);
  if (objc_msgSend(v42, "count"))
  {
    objc_msgSend((id)objc_msgSend(v42, "objectAtIndex:", 0), "point");
    v45 = v44;
    v47 = v46;
    objc_msgSend((id)objc_msgSend(v42, "lastObject"), "point");
    v49 = v48;
    v51 = v50;
    v52 = TSDDistance(v45, v47, v14, v16);
    v53 = TSDDistance(v49, v51, v14, v16);
    v54 = v52 < v53;
    if (v52 >= v53)
      v55 = v51;
    else
      v55 = v47;
    if (v54)
      v56 = v45;
    else
      v56 = v49;
    v57 = TSDSubtractPoints(v56, v55, v14);
    v59 = TSDNormalizePoint(v57, v58);
    v60 = TSDAddPoints(v56, v55, v59);
  }
  else
  {
    v60 = TSDPathNearestAngleOnPathToLine((const CGPath *)objc_msgSend(a3, "CGPath"), v87);
  }
  v62 = v60;
  v63 = v61;
  if (objc_msgSend(v43, "count"))
  {
    objc_msgSend((id)objc_msgSend(v43, "objectAtIndex:", 0), "point");
    v83 = v62;
    v65 = v64;
    v67 = v66;
    objc_msgSend((id)objc_msgSend(v43, "lastObject"), "point");
    v69 = v68;
    v82 = v18;
    v71 = v70;
    v72 = TSDDistance(v65, v67, v14, v16);
    if (v72 >= TSDDistance(v69, v71, v14, v16))
      v65 = v69;
    else
      v71 = v67;
    v73 = TSDSubtractPoints(v65, v71, v14);
    v75 = TSDNormalizePoint(v73, v74);
    v76 = v65;
    v77 = v71;
    v18 = v82;
    v62 = v83;
    v78 = TSDAddPoints(v76, v77, v75);
  }
  else
  {
    v78 = TSDPathNearestAngleOnPathToLine((const CGPath *)objc_msgSend(a3, "CGPath"), v86);
  }
  v80 = v78;
  v81 = v79;

  a6->x = v62;
  a6->y = v63;
  a6[1].x = v80;
  a6[1].y = v81;
  if (a4)
  {
    a4->x = v18;
    a4->y = v85;
  }
  if (a5)
    *a5 = v84;
}

- (id)p_basePath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;

  -[TSDCalloutPathSource naturalSize](self, "naturalSize");
  v4 = v3;
  v6 = v5;
  -[TSDCalloutPathSource cornerRadius](self, "cornerRadius");
  v8 = v7;
  -[TSDCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
  v10 = v9;
  v11 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  -[TSDCalloutPathSource cornerRadius](self, "cornerRadius");
  v13 = v12;
  -[TSDCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
  if (v13 >= v14)
  {
    objc_msgSend(v11, "appendBezierPathWithOvalInRect:", -0.5, -0.5, 1.0, 1.0);
    objc_msgSend(v11, "closePath");
    memset(&v30, 0, sizeof(v30));
    CGAffineTransformMakeScale(&v30, self->mNaturalSize.width, self->mNaturalSize.height);
    v28 = v30;
    CGAffineTransformTranslate(&v29, &v28, 0.5, 0.5);
    v30 = v29;
    v28 = v29;
    CGAffineTransformRotate(&v29, &v28, 0.785398163);
    v30 = v29;
    objc_msgSend(v11, "transformUsingAffineTransform:", &v29);
  }
  else
  {
    v15 = *MEMORY[0x24BDBEFB0];
    v16 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v17 = fmin(v8, v10);
    v18 = TSDAddPoints(0.0, v6, 0.0);
    v20 = v19;
    objc_msgSend(v11, "moveToPoint:");
    v21 = TSDAddPoints(v15, v16, v17);
    objc_msgSend(v11, "appendBezierPathWithArcFromPoint:toPoint:radius:", v15, v16, v21, v22, v17);
    v23 = TSDSubtractPoints(v4, 0.0, 0.0);
    objc_msgSend(v11, "appendBezierPathWithArcFromPoint:toPoint:radius:", v4, 0.0, v23, v24, v17);
    v25 = TSDSubtractPoints(v4, v6, v17);
    objc_msgSend(v11, "appendBezierPathWithArcFromPoint:toPoint:radius:", v4, v6, v25, v26, v17);
    objc_msgSend(v11, "appendBezierPathWithArcFromPoint:toPoint:radius:", 0.0, v6, v18, v20, v17);
    objc_msgSend(v11, "closePath");
  }
  return v11;
}

- (id)p_buildPath
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  double v11[5];

  v11[4] = *(double *)MEMORY[0x24BDAC8D0];
  v3 = -[TSDCalloutPathSource p_basePath](self, "p_basePath");
  -[TSDCalloutPathSource p_tailPosition](self, "p_tailPosition");
  v5 = v4;
  v7 = v6;
  if ((objc_msgSend(v3, "containsPoint:") & 1) == 0)
  {
    -[TSDCalloutPathSource p_getTailPath:center:tailSize:intersections:](self, "p_getTailPath:center:tailSize:intersections:", v3, 0, 0, v11);
    v8 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
    objc_msgSend(v8, "moveToPoint:", v11[0], v11[1]);
    objc_msgSend(v8, "lineToPoint:", v5, v7);
    objc_msgSend(v8, "lineToPoint:", v11[2], v11[3]);
    v9 = +[TSDBezierPath uniteBezierPaths:](TSDBezierPath, "uniteBezierPaths:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v3, v8, 0));
    if (objc_msgSend(v9, "elementCount"))
      return v9;
  }
  return v3;
}

- (void)p_setControlKnobPointForRoundedRect:(CGPoint)a3
{
  -[TSDCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
  TSUClamp();
  -[TSDCalloutPathSource setCornerRadius:](self, "setCornerRadius:");
}

- (CGPoint)p_getControlKnobPointForRoundedRect
{
  double v2;
  double v3;
  double v4;
  CGPoint result;

  -[TSDCalloutPathSource maxCornerRadius](self, "maxCornerRadius");
  TSUClamp();
  *(float *)&v2 = v2;
  v3 = *(float *)&v2;
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

@end
