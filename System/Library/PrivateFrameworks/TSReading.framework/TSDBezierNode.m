@implementation TSDBezierNode

+ (id)bezierNodeWithPoint:(CGPoint)a3
{
  double y;
  double x;
  TSDBezierNode *v5;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc_init(TSDBezierNode);
  -[TSDBezierNode setNodePoint:](v5, "setNodePoint:", x, y);
  -[TSDBezierNode setInControlPoint:](v5, "setInControlPoint:", x, y);
  -[TSDBezierNode setOutControlPoint:](v5, "setOutControlPoint:", x, y);
  -[TSDBezierNode setType:](v5, "setType:", 1);
  return v5;
}

+ (id)bezierNodeWithPoint:(CGPoint)a3 inControlPoint:(CGPoint)a4 outControlPoint:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  TSDBezierNode *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  v11 = objc_alloc_init(TSDBezierNode);
  -[TSDBezierNode setNodePoint:](v11, "setNodePoint:", v10, v9);
  -[TSDBezierNode setInControlPoint:](v11, "setInControlPoint:", v8, v7);
  -[TSDBezierNode setOutControlPoint:](v11, "setOutControlPoint:", x, y);
  -[TSDBezierNode setType:](v11, "setType:", 2);
  v12 = TSDSubtractPoints(x, y, v10);
  v14 = v13;
  v15 = TSDSubtractPoints(v10, v9, v8);
  if (TSDNearlyEqualPoints(v12, v14, v15, v16))
    -[TSDBezierNode setReflectedState:](v11, "setReflectedState:", 1);
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[TSDBezierNode nodePoint](self, "nodePoint");
  objc_msgSend(v4, "setNodePoint:");
  -[TSDBezierNode inControlPoint](self, "inControlPoint");
  objc_msgSend(v4, "setInControlPoint:");
  -[TSDBezierNode outControlPoint](self, "outControlPoint");
  objc_msgSend(v4, "setOutControlPoint:");
  objc_msgSend(v4, "setReflectedState:", -[TSDBezierNode reflectedState](self, "reflectedState"));
  objc_msgSend(v4, "setSelected:", -[TSDBezierNode isSelected](self, "isSelected"));
  objc_msgSend(v4, "setType:", -[TSDBezierNode type](self, "type"));
  return v4;
}

- (void)balanceControlPoints
{
  double x;
  long double v4;
  double v5;
  long double v6;
  long double v7;
  double v8;
  long double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;

  x = self->mNode.x;
  v4 = TSDSubtractPoints(self->mIn.x, self->mIn.y, x);
  v6 = v5;
  v7 = TSDSubtractPoints(self->mOut.x, self->mOut.y, x);
  v9 = v8;
  v10 = TSDPointLength(v4, v6);
  v11 = TSDAngleFromDelta(v4, v6);
  v12 = TSDPointLength(v7, v9);
  v13 = TSDAngleFromDelta(v7, v9);
  if (v10 > 0.001 || v12 > 0.001)
  {
    if (v10 >= 0.001)
    {
      if (v12 >= 0.001)
        v13 = TSDMixAnglesInRadians(v11, v13 + 3.14159265, v12 / (v10 + v12));
      else
        v13 = v11;
    }
    v14 = TSDDeltaFromAngle(v13);
    v16 = TSDMultiplyPointScalar(v14, v15, v10);
    self->mIn.x = TSDAddPoints(v16, v17, x);
    self->mIn.y = v18;
    v19 = TSDDeltaFromAngle(v13 + 3.14159265);
    v21 = TSDMultiplyPointScalar(v19, v20, v12);
    self->mOut.x = TSDAddPoints(v21, v22, x);
    self->mOut.y = v23;
    self->mReflectedState = 1;
  }
}

- (void)setNode:(CGPoint)a3
{
  self->mNode = a3;
}

- (void)moveToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;

  y = a3.y;
  x = a3.x;
  v6 = self->mNode.x;
  v7 = TSDSubtractPoints(self->mIn.x, self->mIn.y, v6);
  v8 = TSDSubtractPoints(self->mOut.x, self->mOut.y, v6);
  self->mNode.x = x;
  self->mNode.y = y;
  self->mIn.x = TSDAddPoints(x, y, v7);
  self->mIn.y = v9;
  self->mOut.x = TSDAddPoints(x, y, v8);
  self->mOut.y = v10;
}

- (void)setInControlPoint:(CGPoint)a3 reflect:(int)a4 constrain:(BOOL)a5
{
  _BOOL4 v5;
  double x;
  double y;
  long double v10;
  long double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  CGFloat v20;

  v5 = a5;
  x = self->mNode.x;
  y = self->mNode.y;
  v10 = TSDSubtractPoints(x, y, a3.x);
  v12 = v10;
  v13 = v11;
  if (v5)
  {
    v12 = TSDShiftConstrainDelta(v10, v11);
    v13 = v14;
  }
  v15 = *MEMORY[0x24BDBEFB0];
  v16 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (!TSDNearlyEqualPoints(v12, v13, *MEMORY[0x24BDBEFB0], v16))
  {
    self->mIn.x = TSDSubtractPoints(x, y, v12);
    self->mIn.y = v17;
    if (a4)
    {
      if (a4 == 1)
      {
        v18 = TSDDistance(x, y, self->mOut.x, self->mOut.y);
        v19 = TSDDistance(v15, v16, v12, v13);
        v12 = TSDMultiplyPointScalar(v12, v13, v18 / v19);
      }
      self->mOut.x = TSDAddPoints(x, y, v12);
      self->mOut.y = v20;
    }
  }
  self->mReflectedState = a4;
}

- (void)setOutControlPoint:(CGPoint)a3 reflect:(int)a4 constrain:(BOOL)a5
{
  _BOOL4 v5;
  double x;
  double y;
  long double v10;
  long double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  CGFloat v20;

  v5 = a5;
  x = self->mNode.x;
  y = self->mNode.y;
  v10 = TSDSubtractPoints(x, y, a3.x);
  v12 = v10;
  v13 = v11;
  if (v5)
  {
    v12 = TSDShiftConstrainDelta(v10, v11);
    v13 = v14;
  }
  v15 = *MEMORY[0x24BDBEFB0];
  v16 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (!TSDNearlyEqualPoints(v12, v13, *MEMORY[0x24BDBEFB0], v16))
  {
    self->mOut.x = TSDSubtractPoints(x, y, v12);
    self->mOut.y = v17;
    if (a4)
    {
      if (a4 == 1)
      {
        v18 = TSDDistance(x, y, self->mIn.x, self->mIn.y);
        v19 = TSDDistance(v15, v16, v12, v13);
        v12 = TSDMultiplyPointScalar(v12, v13, v18 / v19);
      }
      self->mIn.x = TSDAddPoints(x, y, v12);
      self->mIn.y = v20;
    }
  }
  self->mReflectedState = a4;
}

- (void)setInControlPointFromReflection:(CGPoint)a3 constrain:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  double v8;
  double v9;
  long double v10;
  long double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  long double v20;
  long double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v8 = self->mNode.x;
  v9 = self->mNode.y;
  v10 = TSDSubtractPoints(v8, v9, a3.x);
  v12 = v10;
  if (v4)
    v12 = TSDShiftConstrainDelta(v10, v11);
  v13 = TSDAddPoints(v8, v9, v12);
  self->mIn.x = v13;
  self->mIn.y = v14;
  if (self->mReflectedState)
  {
    v15 = v13;
    v16 = v14;
    v17 = TSDDistance(self->mOut.x, self->mOut.y, v8, v9);
    v18 = TSDDistance(v15, v16, v8, v9);
    if (v18 != 0.0)
    {
      v19 = v18;
      v20 = TSDSubtractPoints(x, y, v8);
      if (v4)
        v20 = TSDShiftConstrainDelta(v20, v21);
      v22 = TSDMultiplyPointScalar(v20, v21, 1.0 / v19);
      v24 = TSDMultiplyPointScalar(v22, v23, v17);
      self->mOut.x = TSDAddPoints(v8, v9, v24);
      self->mOut.y = v25;
    }
  }
}

- (void)collapse
{
  CGPoint mNode;

  mNode = self->mNode;
  self->mIn = mNode;
  self->mOut = mNode;
}

- (BOOL)isCollapsed
{
  double x;
  double y;
  _BOOL4 v5;

  x = self->mNode.x;
  y = self->mNode.y;
  v5 = TSDNearlyEqualPoints(self->mIn.x, self->mIn.y, x, y);
  if (v5)
    LOBYTE(v5) = TSDNearlyEqualPoints(self->mOut.x, self->mOut.y, x, y);
  return v5;
}

- (void)updateReflectedState
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  unsigned int v21;
  uint64_t v22;

  x = self->mNode.x;
  y = self->mNode.y;
  v5 = TSDSubtractPoints(self->mOut.x, self->mOut.y, x);
  v7 = v6;
  v8 = *MEMORY[0x24BDBEFB0];
  v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v10 = TSDDistance(v5, v6, *MEMORY[0x24BDBEFB0], v9);
  v11 = TSDMultiplyPointScalar(v5, v7, 1.0 / v10);
  v13 = v12;
  v14 = TSDSubtractPoints(x, y, self->mIn.x);
  v16 = v15;
  v17 = TSDDistance(v14, v15, v8, v9);
  v18 = TSDMultiplyPointScalar(v14, v16, 1.0 / v17);
  v20 = TSDNearlyEqualPoints(v11, v13, v18, v19);
  if (vabdd_f64(v10, v17) >= 0.01)
    v21 = 1;
  else
    v21 = 2;
  if (v20)
    v22 = v21;
  else
    v22 = 0;
  -[TSDBezierNode setReflectedState:](self, "setReflectedState:", v22);
}

- (void)swapControlPoints
{
  CGPoint mIn;

  mIn = self->mIn;
  self->mIn = self->mOut;
  self->mOut = mIn;
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  self->mNode = (CGPoint)vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, self->mNode.y), *(float64x2_t *)&a3->a, self->mNode.x));
  self->mIn = (CGPoint)vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, self->mIn.y), *(float64x2_t *)&a3->a, self->mIn.x));
  self->mOut = (CGPoint)vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, self->mOut.y), *(float64x2_t *)&a3->a, self->mOut.x));
}

- (BOOL)underPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6
{
  double y;
  double x;
  float64x2_t v12;
  int64_t v13;
  _BOOL4 v14;
  double a;
  double d;
  double c;
  double tx;
  double ty;
  double b;

  y = a3.y;
  x = a3.x;
  v12 = vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, self->mNode.y), *(float64x2_t *)&a4->a, self->mNode.x));
  if (TSDDistance(a3.x, a3.y, v12.f64[0], v12.f64[1]) < a5)
  {
    v13 = 0;
    if (!a6)
      goto LABEL_8;
    goto LABEL_7;
  }
  v14 = -[TSDBezierNode isSelected](self, "isSelected");
  if (v14)
  {
    a = a4->a;
    c = a4->c;
    d = a4->d;
    tx = a4->tx;
    ty = a4->ty;
    b = a4->b;
    if (TSDDistance(x, y, tx + self->mIn.y * c + a4->a * self->mIn.x, ty + self->mIn.y * d + b * self->mIn.x) < a5)
    {
      v13 = 1;
      if (!a6)
      {
LABEL_8:
        LOBYTE(v14) = 1;
        return v14;
      }
LABEL_7:
      *a6 = v13;
      goto LABEL_8;
    }
    if (TSDDistance(x, y, tx + c * self->mOut.y + a * self->mOut.x, ty + d * self->mOut.y + b * self->mOut.x) < a5)
    {
      v13 = 2;
      if (!a6)
        goto LABEL_8;
      goto LABEL_7;
    }
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (id)reflectedStateString
{
  uint64_t mReflectedState;

  mReflectedState = self->mReflectedState;
  if (mReflectedState > 2)
    return &stru_24D82FEB0;
  else
    return off_24D82CFE8[mReflectedState];
}

- (id)typeString
{
  uint64_t mType;

  mType = self->mType;
  if (mType > 4)
    return &stru_24D82FEB0;
  else
    return off_24D82D000[mType];
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  id v9;
  const __CFString *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromCGPoint(self->mNode);
  v7 = NSStringFromCGPoint(self->mIn);
  v8 = NSStringFromCGPoint(self->mOut);
  v9 = -[TSDBezierNode reflectedStateString](self, "reflectedStateString");
  if (self->mSelected)
    v10 = CFSTR(" selected");
  else
    v10 = &stru_24D82FEB0;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p node=%@ in=%@ out=%@ reflected=%@%@ %@>"), v5, self, v6, v7, v8, v9, v10, -[TSDBezierNode typeString](self, "typeString"));
}

- (CGPoint)nodePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mNode.x;
  y = self->mNode.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setNodePoint:(CGPoint)a3
{
  self->mNode = a3;
}

- (CGPoint)inControlPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mIn.x;
  y = self->mIn.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInControlPoint:(CGPoint)a3
{
  self->mIn = a3;
}

- (CGPoint)outControlPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mOut.x;
  y = self->mOut.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOutControlPoint:(CGPoint)a3
{
  self->mOut = a3;
}

- (int)reflectedState
{
  return self->mReflectedState;
}

- (void)setReflectedState:(int)a3
{
  self->mReflectedState = a3;
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (BOOL)isSelected
{
  return self->mSelected;
}

- (void)setSelected:(BOOL)a3
{
  self->mSelected = a3;
}

@end
