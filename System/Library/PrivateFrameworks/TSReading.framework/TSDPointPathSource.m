@implementation TSDPointPathSource

+ (id)rightSingleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 1, a3.x, a3.y, a4.width, a4.height);
}

+ (id)leftSingleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 0, a3.x, a3.y, a4.width, a4.height);
}

+ (id)doubleArrowWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 10, a3.x, a3.y, a4.width, a4.height);
}

+ (id)starWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 100, a3.x, a3.y, a4.width, a4.height);
}

+ (id)plusWithPoint:(CGPoint)a3 naturalSize:(CGSize)a4
{
  return (id)objc_msgSend(a1, "pathSourceWithType:point:naturalSize:", 200, a3.x, a3.y, a4.width, a4.height);
}

+ (id)pathSourceWithType:(int)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:point:naturalSize:", *(_QWORD *)&a3, a4.x, a4.y, a5.width, a5.height);
}

- (TSDPointPathSource)initWithType:(int)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  TSDPointPathSource *v10;
  TSDPointPathSource *v11;
  objc_super v13;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v9 = *(_QWORD *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)TSDPointPathSource;
  v10 = -[TSDPointPathSource init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[TSDPointPathSource setType:](v10, "setType:", v9);
    -[TSDPointPathSource setPoint:](v11, "setPoint:", x, y);
    -[TSDPointPathSource setNaturalSize:](v11, "setNaturalSize:", width, height);
  }
  return v11;
}

- (TSDPointPathSource)init
{
  return -[TSDPointPathSource initWithType:point:naturalSize:](self, "initWithType:point:naturalSize:", 0, 25.0, 25.0, 100.0, 100.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDPointPathSource;
  v4 = -[TSDPathSource copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setType:", -[TSDPointPathSource type](self, "type"));
  -[TSDPointPathSource point](self, "point");
  objc_msgSend(v4, "setPoint:");
  -[TSDPointPathSource naturalSize](self, "naturalSize");
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
  double v20;
  double v21;
  double v22;
  objc_super v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (a3 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v25 = v6;
    v26 = v5;
    v27 = v3;
    v28 = v4;
    v24.receiver = self;
    v24.super_class = (Class)TSDPointPathSource;
    v9 = -[TSDPathSource isEqual:](&v24, sel_isEqual_);
    if (v9)
    {
      v10 = -[TSDPointPathSource type](self, "type");
      if (v10 == objc_msgSend(a3, "type"))
      {
        -[TSDPointPathSource point](self, "point");
        v12 = v11;
        v14 = v13;
        objc_msgSend(a3, "point");
        LOBYTE(v9) = 0;
        if (v12 == v16 && v14 == v15)
        {
          -[TSDPointPathSource naturalSize](self, "naturalSize");
          v18 = v17;
          v20 = v19;
          objc_msgSend(a3, "naturalSize");
          LOBYTE(v9) = v20 == v22 && v18 == v21;
        }
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
  void *v4;
  uint64_t v5;
  NSString *v6;
  objc_super v8;
  CGPoint v9;
  CGSize v10;

  v8.receiver = self;
  v8.super_class = (Class)TSDPointPathSource;
  v3 = (void *)objc_msgSend(-[TSDPointPathSource description](&v8, sel_description), "mutableCopy");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = -[TSDPointPathSource type](self, "type");
  -[TSDPointPathSource point](self, "point");
  v6 = NSStringFromCGPoint(v9);
  -[TSDPointPathSource naturalSize](self, "naturalSize");
  objc_msgSend(v3, "appendString:", objc_msgSend(v4, "stringWithFormat:", CFSTR("; type=%d; point=%@; natural size=%@"),
      v5,
      v6,
      NSStringFromCGSize(v10)));
  return v3;
}

- (CGPoint)minPointValue
{
  double v2;
  double v3;
  int v4;
  double v5;
  double v6;
  CGPoint result;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v4 = -[TSDPointPathSource type](self, "type");
  if (v4 == 100)
    v5 = 0.1;
  else
    v5 = v3;
  v6 = 3.0;
  if (v4 != 100)
    v6 = v2;
  result.y = v5;
  result.x = v6;
  return result;
}

- (CGPoint)maxPointValue
{
  double v3;
  double v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v5 = -[TSDPointPathSource type](self, "type");
  if (v5 > 99)
  {
    if (v5 == 100)
    {
      v3 = 1.0;
      v4 = 100.0;
    }
    else if (v5 == 200)
    {
      -[TSDPointPathSource naturalSize](self, "naturalSize");
      v4 = v7 * 0.5;
      v3 = v8 * 0.5;
    }
  }
  else if (v5 >= 2)
  {
    if (v5 == 10)
    {
      -[TSDPointPathSource naturalSize](self, "naturalSize");
      v3 = 0.5;
      v4 = v9 * 0.5;
    }
  }
  else
  {
    -[TSDPointPathSource naturalSize](self, "naturalSize");
    v4 = v6;
    v3 = 0.5;
  }
  v10 = v4;
  v11 = v3;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)scaleToNaturalSize:(CGSize)a3
{
  double height;
  double width;
  unsigned int v6;
  double v7;

  height = a3.height;
  width = a3.width;
  v6 = -[TSDPointPathSource type](self, "type");
  if (v6 <= 0xA && ((1 << v6) & 0x403) != 0 || v6 == 200)
  {
    -[TSDPathSource uniformScaleForScalingToNaturalSize:](self, "uniformScaleForScalingToNaturalSize:", width, height);
    *(double *)&self->mType = v7 * *(double *)&self->mType;
  }
  self->mPoint.y = width;
  self->mNaturalSize.width = height;
}

- (void)setPointValue:(id)a3
{
  objc_msgSend(a3, "CGPointValue");
  -[TSDPointPathSource setPoint:](self, "setPoint:");
}

- (unint64_t)numberOfControlKnobs
{
  if (-[TSDPointPathSource type](self, "type") == 100)
    return 2;
  else
    return 1;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  unsigned int v5;
  double v6;
  double v7;
  CGPoint result;

  v5 = -[TSDPointPathSource type](self, "type");
  if (v5 <= 0xA && ((1 << v5) & 0x403) != 0)
  {
    -[TSDPointPathSource p_getControlKnobPointForArrow](self, "p_getControlKnobPointForArrow");
  }
  else if (v5 == 100)
  {
    if (a3 == 12)
      -[TSDPointPathSource p_getControlKnobPointForStarPoints](self, "p_getControlKnobPointForStarPoints");
    else
      -[TSDPointPathSource p_getControlKnobPointForStarInnerRadius](self, "p_getControlKnobPointForStarInnerRadius");
  }
  else if (v5 == 200)
  {
    -[TSDPointPathSource p_getControlKnobPointForPlus](self, "p_getControlKnobPointForPlus");
  }
  else
  {
    v6 = *MEMORY[0x24BDBEFB0];
    v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y;
  double x;
  unsigned int v8;

  y = a4.y;
  x = a4.x;
  v8 = -[TSDPointPathSource type](self, "type");
  if (v8 <= 0xA && ((1 << v8) & 0x403) != 0)
  {
    -[TSDPointPathSource p_setControlKnobPointForArrow:](self, "p_setControlKnobPointForArrow:", x, y);
  }
  else if (v8 == 100)
  {
    if (a3 == 12)
      -[TSDPointPathSource p_setControlKnobPointForStarPoints:](self, "p_setControlKnobPointForStarPoints:", x, y);
    else
      -[TSDPointPathSource p_setControlKnobPointForStarInnerRadius:](self, "p_setControlKnobPointForStarInnerRadius:", x, y);
  }
  else if (v8 == 200)
  {
    -[TSDPointPathSource p_setControlKnobPointForPlus:](self, "p_setControlKnobPointForPlus:", x, y);
  }
}

- (id)getFeedbackStringForKnob:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v10;

  if (-[TSDPointPathSource type](self, "type") != 100)
    return &stru_24D82FEB0;
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (void *)TSDBundle();
  if (a3 == 12)
  {
    v7 = objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Points: %d"), &stru_24D82FEB0, CFSTR("TSDrawables"));
    -[TSDPointPathSource point](self, "point");
  }
  else
  {
    v7 = objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Radius: %d%%"), &stru_24D82FEB0, CFSTR("TSDrawables"));
    -[TSDPointPathSource point](self, "point");
    v8 = v10 * 100.0;
  }
  return (id)objc_msgSend(v5, "stringWithFormat:", v7, (int)v8);
}

- (CGPath)newFeedbackPathForKnob:(unint64_t)a3
{
  int v5;
  CGPath *Mutable;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGRect v19;

  v5 = -[TSDPointPathSource type](self, "type");
  Mutable = 0;
  if (a3 == 12 && v5 == 100)
  {
    objc_msgSend(-[TSDPathSource bezierPath](self, "bezierPath"), "bounds");
    v8 = v7;
    v10 = v9;
    Mutable = CGPathCreateMutable();
    -[TSDPointPathSource naturalSize](self, "naturalSize");
    v12 = -(v8 - v11 * 0.15);
    -[TSDPointPathSource naturalSize](self, "naturalSize");
    v14 = -(v10 - v13 * 0.15);
    -[TSDPointPathSource naturalSize](self, "naturalSize");
    v16 = v15 * 0.7;
    -[TSDPointPathSource naturalSize](self, "naturalSize");
    v19.size.height = v17 * 0.7;
    v19.origin.x = v12;
    v19.origin.y = v14;
    v19.size.width = v16;
    CGPathAddEllipseInRect(Mutable, 0, v19);
  }
  return Mutable;
}

- (id)valueForSetSelector:(SEL)a3
{
  void *v4;
  objc_super v5;

  if (sel_setPointValue_ == a3)
  {
    v4 = (void *)MEMORY[0x24BDD1968];
    -[TSDPointPathSource point](self, "point");
    return (id)objc_msgSend(v4, "valueWithCGPoint:");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSDPointPathSource;
    return -[TSDPathSource valueForSetSelector:](&v5, sel_valueForSetSelector_);
  }
}

- (id)bezierPathWithoutFlips
{
  unsigned int v3;
  CGPath *v4;
  const CGPath *v5;
  TSDBezierPath *v6;

  v3 = -[TSDPointPathSource type](self, "type");
  if (v3 <= 0xA && ((1 << v3) & 0x403) != 0)
  {
    v4 = -[TSDPointPathSource p_newArrowPath](self, "p_newArrowPath");
  }
  else if (v3 == 100)
  {
    v4 = -[TSDPointPathSource p_newStarPath](self, "p_newStarPath");
  }
  else
  {
    if (v3 != 200)
    {
      v5 = 0;
      goto LABEL_9;
    }
    v4 = -[TSDPointPathSource p_newPlusPath](self, "p_newPlusPath");
  }
  v5 = v4;
LABEL_9:
  v6 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v5);
  CGPathRelease(v5);
  return v6;
}

- (BOOL)isRectangular
{
  -[TSDPointPathSource type](self, "type");
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (CGSize)scaleFactorForInscribedRectangle
{
  unsigned int v3;
  double v4;
  unsigned int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double *v11;
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
  uint64_t v22;
  double v23;
  float v24;
  double v25;
  double v26;
  double v27;
  double v28[7];
  CGSize result;

  v28[6] = *(double *)MEMORY[0x24BDAC8D0];
  v3 = -[TSDPointPathSource type](self, "type");
  v4 = 1.0;
  if (v3 > 0xA)
  {
    v6 = 1.0;
  }
  else
  {
    v5 = v3;
    v6 = 1.0;
    if (((1 << v3) & 0x403) != 0)
    {
      -[TSDPointPathSource naturalSize](self, "naturalSize", 1.0, 1.0);
      v8 = v7;
      v10 = v9;
      v11 = (double *)MEMORY[0x24BDBF148];
      v12 = *(double *)(MEMORY[0x24BDBF148] + 8);
      -[TSDPointPathSource point](self, "point");
      if (v5 == 1)
      {
        TSUClamp();
        v15 = v8 - v18;
        v16 = v10 * 0.5;
        TSUClamp();
      }
      else
      {
        if (v5 == 10)
        {
          v13 = v8 * 0.5;
          TSUClamp();
          v15 = v14;
          v16 = v10 * 0.5;
          TSUClamp();
          goto LABEL_13;
        }
        TSUClamp();
        v15 = v19;
        v16 = v10 * 0.5;
        TSUClamp();
        if (v5 >= 2)
        {
          v13 = v8 * 0.5;
LABEL_13:
          v22 = 0;
          v21 = *v11;
          v23 = v10 + v17 * -2.0;
          v28[0] = v8 + v15 * -2.0 * (v23 / v10);
          v28[1] = v23;
          v28[2] = v15 * 0.5;
          v28[3] = v16;
          v24 = v16;
          *(float *)&v23 = v23;
          v28[4] = v13;
          v28[5] = fminf(v24, *(float *)&v23);
          v25 = 0.0;
          do
          {
            v27 = v28[v22];
            v26 = v28[v22 + 1];
            if (v26 * v27 >= v25)
            {
              v21 = v28[v22];
              v12 = v28[v22 + 1];
              v25 = v26 * v27;
            }
            v22 += 2;
          }
          while (v22 != 6);
          goto LABEL_17;
        }
      }
      v20 = v10 + v17 * -2.0;
      v21 = v15 + v12 / v10 * (v8 - v15);
      if (v20 * v21 > v16 * ((v8 - v15) * 0.5))
      {
        v12 = v20;
      }
      else
      {
        v21 = (v8 - v15) * 0.5;
        v12 = v16;
      }
LABEL_17:
      v4 = v21 / v8;
      v6 = v12 / v10;
    }
  }
  result.height = v6;
  result.width = v4;
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__TSDPointPathSource_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __43__TSDPointPathSource_mixingTypeWithObject___block_invoke(uint64_t a1)
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
  double v15;
  double v16;
  double v17;
  double v19;
  double v20;
  double v21;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDPointPathSource mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPointPathSource.m"), 477, CFSTR("nil object after cast"));
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
    objc_msgSend(*(id *)(a1 + 40), "point");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v2, "point");
    if (TSDNearlyEqualPoints(v13, v15, v16, v17))
      return 4;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "type") != 100)
    return 3;
  objc_msgSend(*(id *)(a1 + 40), "point");
  v20 = v19;
  objc_msgSend(v2, "point");
  if (vabdd_f64(v20, v21) <= 2.0)
    return 2;
  else
    return 3;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__TSDPointPathSource_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDPointPathSource *__55__TSDPointPathSource_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  objc_msgSend(*(id *)(a1 + 40), "point");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v2, "point");
  TSDMixPoints(v4, v6, v7, v8, *(double *)(a1 + 48));
  v9 = TSDRoundedPoint();
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 40), "naturalSize");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v2, "naturalSize");
  v18 = TSDMixSizes(v13, v15, v16, v17, *(double *)(a1 + 48));
  return +[TSDPointPathSource pathSourceWithType:point:naturalSize:](TSDPointPathSource, "pathSourceWithType:point:naturalSize:", objc_msgSend(*(id *)(a1 + 40), "type"), v9, v11, v18, v19);
}

- (CGPath)p_newArrowPath
{
  CGPath *Mutable;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat *v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  int v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  CGFloat MaxY;
  CGFloat MinX;
  CGFloat MidY;
  CGFloat v26;
  CGFloat MaxX;
  CGFloat v28;
  CGFloat v29;
  CGPath *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  Mutable = CGPathCreateMutable();
  -[TSDPointPathSource naturalSize](self, "naturalSize");
  v5 = v4;
  v7 = v6;
  v8 = (CGFloat *)MEMORY[0x24BDBEFB0];
  -[TSDPointPathSource point](self, "point");
  -[TSDPointPathSource naturalSize](self, "naturalSize");
  if (*(_DWORD *)(&self->super.mVerticalFlip + 3) == 1)
  {
    TSUClamp();
    v11 = v5 - v9;
  }
  else
  {
    TSUClamp();
    v11 = v10;
  }
  v13 = *v8;
  v12 = v8[1];
  TSUClamp();
  v15 = v14;
  v16 = *(_DWORD *)(&self->super.mVerticalFlip + 3);
  if (v16 == 10)
  {
    v17 = v7 - v14;
    CGPathMoveToPoint(Mutable, 0, v11, v7 - v14);
    v41.origin.x = v13;
    v41.origin.y = v12;
    v41.size.width = v5;
    v41.size.height = v7;
    MaxY = CGRectGetMaxY(v41);
    CGPathAddLineToPoint(Mutable, 0, v11, MaxY);
    v42.origin.x = v13;
    v42.origin.y = v12;
    v42.size.width = v5;
    v42.size.height = v7;
    MinX = CGRectGetMinX(v42);
    v43.origin.x = v13;
    v43.origin.y = v12;
    v43.size.width = v5;
    v43.size.height = v7;
    MidY = CGRectGetMidY(v43);
    CGPathAddLineToPoint(Mutable, 0, MinX, MidY);
    CGPathAddLineToPoint(Mutable, 0, v11, 0.0);
    CGPathAddLineToPoint(Mutable, 0, v11, v15);
    v26 = v5 - v11;
    CGPathAddLineToPoint(Mutable, 0, v26, v15);
    CGPathAddLineToPoint(Mutable, 0, v26, 0.0);
    v44.origin.x = v13;
    v44.origin.y = v12;
    v44.size.width = v5;
    v44.size.height = v7;
    MaxX = CGRectGetMaxX(v44);
    v45.origin.x = v13;
    v45.origin.y = v12;
    v45.size.width = v5;
    v45.size.height = v7;
    v28 = CGRectGetMidY(v45);
    CGPathAddLineToPoint(Mutable, 0, MaxX, v28);
    v46.origin.x = v13;
    v46.origin.y = v12;
    v46.size.width = v5;
    v46.size.height = v7;
    v29 = CGRectGetMaxY(v46);
    CGPathAddLineToPoint(Mutable, 0, v26, v29);
    v30 = Mutable;
    v22 = v26;
  }
  else
  {
    if (v16 == 1)
    {
      v17 = v7 - v14;
      CGPathMoveToPoint(Mutable, 0, v11, v7 - v14);
      v47.origin.x = v13;
      v47.origin.y = v12;
      v47.size.width = v5;
      v47.size.height = v7;
      v31 = CGRectGetMaxY(v47);
      CGPathAddLineToPoint(Mutable, 0, v11, v31);
      v48.origin.x = v13;
      v48.origin.y = v12;
      v48.size.width = v5;
      v48.size.height = v7;
      v32 = CGRectGetMaxX(v48);
      v49.origin.x = v13;
      v49.origin.y = v12;
      v49.size.width = v5;
      v49.size.height = v7;
      v33 = CGRectGetMidY(v49);
      CGPathAddLineToPoint(Mutable, 0, v32, v33);
      CGPathAddLineToPoint(Mutable, 0, v11, 0.0);
      CGPathAddLineToPoint(Mutable, 0, v11, v15);
      v50.origin.x = v13;
      v50.origin.y = v12;
      v50.size.width = v5;
      v50.size.height = v7;
      v34 = CGRectGetMinX(v50);
      CGPathAddLineToPoint(Mutable, 0, v34, v15);
      v51.origin.x = v13;
      v51.origin.y = v12;
      v51.size.width = v5;
      v51.size.height = v7;
      v22 = CGRectGetMinX(v51);
    }
    else
    {
      if (v16)
        return Mutable;
      v17 = v7 - v14;
      CGPathMoveToPoint(Mutable, 0, v11, v7 - v14);
      v36.origin.x = v13;
      v36.origin.y = v12;
      v36.size.width = v5;
      v36.size.height = v7;
      v18 = CGRectGetMaxY(v36);
      CGPathAddLineToPoint(Mutable, 0, v11, v18);
      v37.origin.x = v13;
      v37.origin.y = v12;
      v37.size.width = v5;
      v37.size.height = v7;
      v19 = CGRectGetMinX(v37);
      v38.origin.x = v13;
      v38.origin.y = v12;
      v38.size.width = v5;
      v38.size.height = v7;
      v20 = CGRectGetMidY(v38);
      CGPathAddLineToPoint(Mutable, 0, v19, v20);
      CGPathAddLineToPoint(Mutable, 0, v11, 0.0);
      CGPathAddLineToPoint(Mutable, 0, v11, v15);
      v39.origin.x = v13;
      v39.origin.y = v12;
      v39.size.width = v5;
      v39.size.height = v7;
      v21 = CGRectGetMaxX(v39);
      CGPathAddLineToPoint(Mutable, 0, v21, v15);
      v40.origin.x = v13;
      v40.origin.y = v12;
      v40.size.width = v5;
      v40.size.height = v7;
      v22 = CGRectGetMaxX(v40);
    }
    v30 = Mutable;
  }
  CGPathAddLineToPoint(v30, 0, v22, v17);
  if (vabdd_f64(v15, v17) > 0.01)
    CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)p_newStarPath
{
  CGPath *Mutable;
  double v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  double v15;
  double v16;
  double v17;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform m;

  Mutable = CGPathCreateMutable();
  -[TSDPointPathSource point](self, "point");
  if (v4 >= 3.0)
  {
    -[TSDPointPathSource point](self, "point");
    v5 = 2 * (int)v6;
  }
  else
  {
    v5 = 6;
  }
  -[TSDPointPathSource naturalSize](self, "naturalSize");
  v8 = v7;
  v10 = v9;
  v11 = v7 * 0.5;
  -[TSDPointPathSource point](self, "point");
  v13 = v12;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeScale(&m, 1.0, v10 / v8);
  v19 = m;
  CGAffineTransformTranslate(&v20, &v19, v11, v11);
  m = v20;
  if (v5 >= 1)
  {
    v14 = 0;
    v15 = v13 * v11;
    v16 = 0.0;
    while (1)
    {
      v20.a = 0.0;
      v20.b = 0.0;
      v17 = 6.28318531 / (double)v5 * v16 + -1.57079633;
      if ((v14 & 1) != 0)
        break;
      TSDOriginRotate(&v20.a, v11, v17);
      if (v14)
        goto LABEL_10;
      CGPathMoveToPoint(Mutable, &m, v20.a, v20.b);
LABEL_11:
      v16 = v16 + 1.0;
      if (v5 == ++v14)
        goto LABEL_12;
    }
    TSDOriginRotate(&v20.a, v15, v17);
LABEL_10:
    CGPathAddLineToPoint(Mutable, &m, v20.a, v20.b);
    goto LABEL_11;
  }
LABEL_12:
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPath)p_newPlusPath
{
  CGPath *Mutable;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;

  Mutable = CGPathCreateMutable();
  -[TSDPointPathSource naturalSize](self, "naturalSize");
  v5 = v4;
  v7 = v6;
  -[TSDPointPathSource point](self, "point");
  TSUClamp();
  v9 = v8;
  TSUClamp();
  v11 = v10;
  CGPathMoveToPoint(Mutable, 0, v9, 0.0);
  CGPathAddLineToPoint(Mutable, 0, v5 - v9, 0.0);
  CGPathAddLineToPoint(Mutable, 0, v5 - v9, v11);
  CGPathAddLineToPoint(Mutable, 0, v5, v11);
  CGPathAddLineToPoint(Mutable, 0, v5, v7 - v11);
  CGPathAddLineToPoint(Mutable, 0, v5 - v9, v7 - v11);
  CGPathAddLineToPoint(Mutable, 0, v5 - v9, v7);
  CGPathAddLineToPoint(Mutable, 0, v9, v7);
  CGPathAddLineToPoint(Mutable, 0, v9, v7 - v11);
  CGPathAddLineToPoint(Mutable, 0, 0.0, v7 - v11);
  CGPathAddLineToPoint(Mutable, 0, 0.0, v11);
  CGPathAddLineToPoint(Mutable, 0, v9, v11);
  CGPathAddLineToPoint(Mutable, 0, v9, 0.0);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (void)p_setControlKnobPointForArrow:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;

  -[TSDPointPathSource naturalSize](self, "naturalSize");
  v5 = v4;
  TSUClamp();
  v7 = v6;
  if (-[TSDPointPathSource p_isRightFacingArrow](self, "p_isRightFacingArrow"))
    v7 = v5 - v7;
  TSUClamp();
  *(double *)&self->mType = v7;
  self->mPoint.x = v8;
}

- (CGPoint)p_getControlKnobPointForArrow
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[TSDPointPathSource naturalSize](self, "naturalSize");
  -[TSDPointPathSource p_isRightFacingArrow](self, "p_isRightFacingArrow");
  TSUClamp();
  v4 = v3;
  TSUClamp();
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)p_setControlKnobPointForStarPoints:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  int v18;

  y = a3.y;
  x = a3.x;
  -[TSDPointPathSource naturalSize](self, "naturalSize");
  v7 = v6;
  v9 = v8;
  v10 = -[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v11 = v9 - y;
  if (!v10)
    v11 = y;
  v12 = x - v7 * 0.5;
  v13 = v7 / v9 * (v11 - v9 * 0.5);
  v14 = TSDPointLength(v12, v13);
  v15 = acos(-v12 / v14);
  if (v13 > 0.0)
    v15 = 6.28318531 - v15;
  v16 = v15 / 6.28318531 + -0.25;
  if (v16 < 0.0)
    v16 = v16 + 1.0;
  v17 = (int)(v16 * 18.0 + 3.5);
  if (v17 > 20)
    v17 = 3;
  v18 = (int)*(double *)&self->mType;
  if ((v18 != 3 || v17 == 4) && (v18 != 20 || v17 == 19))
    *(double *)&self->mType = (double)v17;
}

- (CGPoint)p_getControlKnobPointForStarPoints
{
  double v3;
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

  v3 = *(double *)&self->mType;
  -[TSDPointPathSource naturalSize](self, "naturalSize");
  v5 = v4;
  v7 = v6;
  v8 = v4 * 0.5;
  v14 = 0.0;
  v15 = 0.0;
  v9 = v4 * 0.5 * 0.7;
  v10 = ((float)((float)((int)v3 - 3) / 18.0) + -0.25) * 6.28318531;
  if (v3 < 3.0)
    v10 = -1.57079633;
  TSDOriginRotate(&v14, v9, v10);
  v14 = v8 + v14;
  v15 = v7 * 0.5 + v7 / v5 * v15;
  v11 = -[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v12 = v14;
  v13 = v15;
  if (v11)
    v13 = v7 - v15;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)p_setControlKnobPointForStarInnerRadius:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int *p_mType;
  uint64_t v12;
  uint64_t v13;

  y = a3.y;
  x = a3.x;
  -[TSDPointPathSource naturalSize](self, "naturalSize");
  v7 = v6;
  v9 = v8;
  if (-[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip"))
    v10 = v9 - y;
  else
    v10 = y;
  TSDPointLength(x - v7 * 0.5, v7 / v9 * (v10 - v9 * 0.5));
  p_mType = &self->mType;
  v12 = *(_QWORD *)p_mType;
  TSUClamp();
  *(_QWORD *)p_mType = v12;
  *((_QWORD *)p_mType + 1) = v13;
}

- (CGPoint)p_getControlKnobPointForStarInnerRadius
{
  int *p_mType;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  p_mType = &self->mType;
  v4 = *(double *)&self->mType;
  -[TSDPointPathSource naturalSize](self, "naturalSize");
  v6 = v5;
  v8 = v7;
  v9 = v5 * 0.5;
  v10 = *((double *)p_mType + 1) * (v5 * 0.5);
  v15 = 0.0;
  v16 = 0.0;
  v11 = 3.14159265 / (double)(int)v4 + -1.57079633;
  if (v4 < 3.0)
    v11 = -0.523598776;
  TSDOriginRotate(&v15, v10, v11);
  v15 = v9 + v15;
  v16 = v8 * 0.5 + v8 / v6 * v16;
  v12 = -[TSDPathSource hasVerticalFlip](self, "hasVerticalFlip");
  v13 = v15;
  v14 = v16;
  if (v12)
    v14 = v8 - v16;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)p_setControlKnobPointForPlus:(CGPoint)a3
{
  uint64_t v4;
  uint64_t v5;
  CGFloat v6;

  -[TSDPointPathSource naturalSize](self, "naturalSize");
  TSUClamp();
  v5 = v4;
  TSUClamp();
  *(_QWORD *)&self->mType = v5;
  self->mPoint.x = v6;
}

- (CGPoint)p_getControlKnobPointForPlus
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGPoint result;

  -[TSDPointPathSource naturalSize](self, "naturalSize");
  v4 = (v3 - *(double *)&self->mType) * 0.5;
  v6 = (v5 - self->mPoint.x) * 0.5;
  result.y = v6;
  result.x = v4;
  return result;
}

- (BOOL)p_isRightFacingArrow
{
  if (*(_DWORD *)(&self->super.mVerticalFlip + 3) == 1)
    return !-[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip");
  else
    return 0;
}

- (BOOL)p_isFlippedDoubleArrow
{
  return *(_DWORD *)(&self->super.mVerticalFlip + 3) == 10
      && -[TSDPathSource hasHorizontalFlip](self, "hasHorizontalFlip");
}

- (int)type
{
  return *(_DWORD *)(&self->super.mVerticalFlip + 3);
}

- (void)setType:(int)a3
{
  *(_DWORD *)(&self->super.mVerticalFlip + 3) = a3;
}

- (CGPoint)point
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->mType, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->mType, &v3, 16, 1, 0);
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->mPoint.y, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setNaturalSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->mPoint.y, &v3, 16, 1, 0);
}

@end
