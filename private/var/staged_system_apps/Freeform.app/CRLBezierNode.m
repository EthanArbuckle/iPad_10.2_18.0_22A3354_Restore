@implementation CRLBezierNode

+ (CRLBezierNode)bezierNodeWithPoint:(CGPoint)a3
{
  double y;
  double x;
  CRLBezierNode *v5;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc_init(CRLBezierNode);
  -[CRLBezierNode setNodePoint:](v5, "setNodePoint:", x, y);
  -[CRLBezierNode setInControlPoint:](v5, "setInControlPoint:", x, y);
  -[CRLBezierNode setOutControlPoint:](v5, "setOutControlPoint:", x, y);
  -[CRLBezierNode setType:](v5, "setType:", 1);
  return v5;
}

+ (CRLBezierNode)bezierNodeWithPoint:(CGPoint)a3 inControlPoint:(CGPoint)a4 outControlPoint:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  CRLBezierNode *v11;
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
  v11 = objc_alloc_init(CRLBezierNode);
  -[CRLBezierNode setNodePoint:](v11, "setNodePoint:", v10, v9);
  -[CRLBezierNode setInControlPoint:](v11, "setInControlPoint:", v8, v7);
  -[CRLBezierNode setOutControlPoint:](v11, "setOutControlPoint:", x, y);
  -[CRLBezierNode setType:](v11, "setType:", 2);
  v12 = sub_1000603B8(x, y, v10);
  v14 = v13;
  v15 = sub_1000603B8(v10, v9, v8);
  if (sub_10005FDF0(v12, v14, v15, v16))
    -[CRLBezierNode setReflectedState:](v11, "setReflectedState:", 1);
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5;
  id v6;
  id v7;

  *(_QWORD *)&v5 = objc_opt_class(self, a2).n128_u64[0];
  v7 = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  -[CRLBezierNode nodePoint](self, "nodePoint");
  objc_msgSend(v7, "setNodePoint:");
  -[CRLBezierNode inControlPoint](self, "inControlPoint");
  objc_msgSend(v7, "setInControlPoint:");
  -[CRLBezierNode outControlPoint](self, "outControlPoint");
  objc_msgSend(v7, "setOutControlPoint:");
  objc_msgSend(v7, "setReflectedState:", -[CRLBezierNode reflectedState](self, "reflectedState"));
  objc_msgSend(v7, "setSelected:", -[CRLBezierNode isSelected](self, "isSelected"));
  objc_msgSend(v7, "setType:", -[CRLBezierNode type](self, "type"));
  return v7;
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
  v4 = sub_1000603B8(self->mIn.x, self->mIn.y, x);
  v6 = v5;
  v7 = sub_1000603B8(self->mOut.x, self->mOut.y, x);
  v9 = v8;
  v10 = sub_100061070(v4, v6);
  v11 = sub_1000618B4(v4, v6);
  v12 = sub_100061070(v7, v9);
  v13 = sub_1000618B4(v7, v9);
  if (v10 > 0.001 || v12 > 0.001)
  {
    if (v10 >= 0.001)
    {
      if (v12 >= 0.001)
        v13 = sub_100061A5C(v11, v13 + 3.14159265, v12 / (v10 + v12));
      else
        v13 = v11;
    }
    v14 = sub_100061F64(v13);
    v16 = sub_1000603DC(v14, v15, v10);
    self->mIn.x = sub_1000603D0(v16, v17, x);
    self->mIn.y = v18;
    v19 = sub_100061F64(v13 + 3.14159265);
    v21 = sub_1000603DC(v19, v20, v12);
    self->mOut.x = sub_1000603D0(v21, v22, x);
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
  v7 = sub_1000603B8(self->mIn.x, self->mIn.y, v6);
  v8 = sub_1000603B8(self->mOut.x, self->mOut.y, v6);
  self->mNode.x = x;
  self->mNode.y = y;
  self->mIn.x = sub_1000603D0(x, y, v7);
  self->mIn.y = v9;
  self->mOut.x = sub_1000603D0(x, y, v8);
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
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;

  v5 = a5;
  x = self->mNode.x;
  y = self->mNode.y;
  v10 = sub_1000603B8(x, y, a3.x);
  v12 = v10;
  v13 = v11;
  if (v5)
  {
    v12 = sub_100061F98(v10, v11);
    v13 = v14;
  }
  v15 = CGPointZero.y;
  if (!sub_10005FDF0(v12, v13, CGPointZero.x, v15))
  {
    self->mIn.x = sub_1000603B8(x, y, v12);
    self->mIn.y = v16;
    if (a4)
    {
      if (a4 == 1)
      {
        v17 = sub_10006108C(x, y, self->mOut.x, self->mOut.y);
        v18 = sub_10006108C(CGPointZero.x, v15, v12, v13);
        v12 = sub_1000603DC(v12, v13, v17 / v18);
      }
      self->mOut.x = sub_1000603D0(x, y, v12);
      self->mOut.y = v19;
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
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;

  v5 = a5;
  x = self->mNode.x;
  y = self->mNode.y;
  v10 = sub_1000603B8(x, y, a3.x);
  v12 = v10;
  v13 = v11;
  if (v5)
  {
    v12 = sub_100061F98(v10, v11);
    v13 = v14;
  }
  v15 = CGPointZero.y;
  if (!sub_10005FDF0(v12, v13, CGPointZero.x, v15))
  {
    self->mOut.x = sub_1000603B8(x, y, v12);
    self->mOut.y = v16;
    if (a4)
    {
      if (a4 == 1)
      {
        v17 = sub_10006108C(x, y, self->mIn.x, self->mIn.y);
        v18 = sub_10006108C(CGPointZero.x, v15, v12, v13);
        v12 = sub_1000603DC(v12, v13, v17 / v18);
      }
      self->mIn.x = sub_1000603D0(x, y, v12);
      self->mIn.y = v19;
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
  v10 = sub_1000603B8(v8, v9, a3.x);
  v12 = v10;
  if (v4)
    v12 = sub_100061F98(v10, v11);
  v13 = sub_1000603D0(v8, v9, v12);
  self->mIn.x = v13;
  self->mIn.y = v14;
  if (self->mReflectedState)
  {
    v15 = v13;
    v16 = v14;
    v17 = sub_10006108C(self->mOut.x, self->mOut.y, v8, v9);
    v18 = sub_10006108C(v15, v16, v8, v9);
    if (v18 != 0.0)
    {
      v19 = v18;
      v20 = sub_1000603B8(x, y, v8);
      if (v4)
        v20 = sub_100061F98(v20, v21);
      v22 = sub_1000603DC(v20, v21, 1.0 / v19);
      v24 = sub_1000603DC(v22, v23, v17);
      self->mOut.x = sub_1000603D0(v8, v9, v24);
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
  v5 = sub_10005FDF0(self->mIn.x, self->mIn.y, x, y);
  if (v5)
    LOBYTE(v5) = sub_10005FDF0(self->mOut.x, self->mOut.y, x, y);
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
  _BOOL4 v19;
  unsigned int v20;
  uint64_t v21;

  x = self->mNode.x;
  y = self->mNode.y;
  v5 = sub_1000603B8(self->mOut.x, self->mOut.y, x);
  v7 = v6;
  v8 = CGPointZero.y;
  v9 = sub_10006108C(v5, v6, CGPointZero.x, v8);
  v10 = sub_1000603DC(v5, v7, 1.0 / v9);
  v12 = v11;
  v13 = sub_1000603B8(x, y, self->mIn.x);
  v15 = v14;
  v16 = sub_10006108C(v13, v14, CGPointZero.x, v8);
  v17 = sub_1000603DC(v13, v15, 1.0 / v16);
  v19 = sub_10005FDF0(v10, v12, v17, v18);
  if (vabdd_f64(v9, v16) >= 0.01)
    v20 = 1;
  else
    v20 = 2;
  if (v19)
    v21 = v20;
  else
    v21 = 0;
  -[CRLBezierNode setReflectedState:](self, "setReflectedState:", v21);
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
  if (sub_10006108C(a3.x, a3.y, v12.f64[0], v12.f64[1]) < a5)
  {
    v13 = 0;
    if (!a6)
      goto LABEL_8;
    goto LABEL_7;
  }
  v14 = -[CRLBezierNode isSelected](self, "isSelected");
  if (v14)
  {
    a = a4->a;
    c = a4->c;
    d = a4->d;
    tx = a4->tx;
    ty = a4->ty;
    b = a4->b;
    if (sub_10006108C(x, y, tx + self->mIn.y * c + a4->a * self->mIn.x, ty + self->mIn.y * d + b * self->mIn.x) < a5)
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
    if (sub_10006108C(x, y, tx + c * self->mOut.y + a * self->mOut.x, ty + d * self->mOut.y + b * self->mOut.x) < a5)
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
    return &stru_1012A72B0;
  else
    return off_10123D6B8[mReflectedState];
}

- (id)typeString
{
  unint64_t mType;

  mType = self->mType;
  if (mType > 4)
    return &stru_1012A72B0;
  else
    return off_10123D6D0[mType];
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromCGPoint(self->mNode);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromCGPoint(self->mIn);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = NSStringFromCGPoint(self->mOut);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierNode reflectedStateString](self, "reflectedStateString"));
  if (self->mSelected)
    v13 = CFSTR(" selected");
  else
    v13 = &stru_1012A72B0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBezierNode typeString](self, "typeString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p node=%@ in=%@ out=%@ reflected=%@%@ %@>"), v5, self, v7, v9, v11, v12, v13, v14));

  return v15;
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

- (int64_t)type
{
  return self->mType;
}

- (void)setType:(int64_t)a3
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
