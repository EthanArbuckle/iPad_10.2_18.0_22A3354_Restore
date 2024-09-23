@implementation TSDBezierSegment

+ (id)segmentFromPoint:(CGPoint)a3 outPoint:(CGPoint)a4 inPoint:(CGPoint)a5 toPoint:(CGPoint)a6
{
  return -[TSDBezierSegment initFromPoint:outPoint:inPoint:toPoint:]([TSDBezierSegment alloc], "initFromPoint:outPoint:inPoint:toPoint:", a3.x, a3.y, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y);
}

- (id)description
{
  void *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = NSStringFromCGPoint(self->mA);
  v5 = NSStringFromCGPoint(self->mOut);
  v6 = NSStringFromCGPoint(self->mIn);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@ - %@ - %@"), v4, v5, v6, NSStringFromCGPoint(self->mB));
}

- (BOOL)bogusSegment
{
  double x;
  double y;
  double v5;
  double v6;
  BOOL result;

  x = self->mOut.x;
  y = self->mOut.y;
  result = 0;
  if (TSDNearlyEqualPoints(self->mA.x, self->mA.y, x, y))
  {
    v5 = self->mIn.x;
    v6 = self->mIn.y;
    if (TSDNearlyEqualPoints(x, y, v5, v6) && TSDNearlyEqualPoints(v5, v6, self->mB.x, self->mB.y))
      return 1;
  }
  return result;
}

- (id)initFromPoint:(CGPoint)a3 outPoint:(CGPoint)a4 inPoint:(CGPoint)a5 toPoint:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id result;
  objc_super v15;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)TSDBezierSegment;
  result = -[TSDBezierSegment init](&v15, sel_init);
  if (result)
  {
    *((CGFloat *)result + 1) = v13;
    *((CGFloat *)result + 2) = v12;
    *((CGFloat *)result + 3) = v11;
    *((CGFloat *)result + 4) = v10;
    *((CGFloat *)result + 5) = v9;
    *((CGFloat *)result + 6) = v8;
    *((CGFloat *)result + 7) = x;
    *((CGFloat *)result + 8) = y;
  }
  return result;
}

- (CGPoint)fromPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mA.x;
  y = self->mA.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)toPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mB.x;
  y = self->mB.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)inPoint
{
  double x;
  double y;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  x = self->mIn.x;
  y = self->mIn.y;
  v5 = self->mB.x;
  v6 = self->mB.y;
  if (TSDNearlyEqualPoints(x, y, v5, v6))
  {
    x = self->mOut.x;
    y = self->mOut.y;
    if (TSDNearlyEqualPoints(x, y, v5, v6))
    {
      x = self->mA.x;
      y = self->mA.y;
    }
  }
  v7 = x;
  v8 = y;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)outPoint
{
  double x;
  double y;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  x = self->mOut.x;
  y = self->mOut.y;
  v5 = self->mA.x;
  v6 = self->mA.y;
  if (TSDNearlyEqualPoints(x, y, v5, v6))
  {
    x = self->mIn.x;
    y = self->mIn.y;
    if (TSDNearlyEqualPoints(x, y, v5, v6))
    {
      x = self->mB.x;
      y = self->mB.y;
    }
  }
  v7 = x;
  v8 = y;
  result.y = v8;
  result.x = v7;
  return result;
}

- (double)parametricValueForPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  int v6;
  double v7;
  double v8;
  float64x2_t v9;
  double v10;
  CGPoint mB;
  CGPoint mIn;
  CGPoint mOut;
  CGPoint mA;

  y = a3.y;
  x = a3.x;
  mOut = self->mOut;
  mA = self->mA;
  mB = self->mB;
  mIn = self->mIn;
  v5 = 0.0;
  v6 = 1001;
  v7 = 1000000.0;
  v8 = 0.0;
  do
  {
    v8 = v8 + 0.001;
    v9 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)mOut, v8 * 3.0 * ((1.0 - v8) * (1.0 - v8))), (float64x2_t)mA, (1.0 - v8) * ((1.0 - v8) * (1.0 - v8))), (float64x2_t)mIn, (1.0 - v8) * (v8 * v8 * 3.0)), (float64x2_t)mB, v8 * (v8 * v8));
    v10 = TSDDistance(v9.f64[0], v9.f64[1], x, y);
    if (v10 < v7)
    {
      v7 = v10;
      v5 = v8;
    }
    --v6;
  }
  while (v6);
  return v5;
}

- (void)splitAtParametricValue:(double)a3 left:(id *)a4 right:(id *)a5
{
  double x;
  double y;
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
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;

  x = self->mOut.x;
  y = self->mOut.y;
  v11 = self->mA.x;
  v12 = self->mA.y;
  v50 = v12;
  v51 = v11;
  v13 = TSDSubtractPoints(x, y, v11);
  v15 = TSDMultiplyPointScalar(v13, v14, a3);
  v52 = TSDAddPoints(v11, v12, v15);
  v17 = v16;
  v19 = self->mIn.x;
  v18 = self->mIn.y;
  v20 = TSDSubtractPoints(v19, v18, x);
  v22 = TSDMultiplyPointScalar(v20, v21, a3);
  v23 = TSDAddPoints(x, y, v22);
  v25 = v24;
  v26 = TSDSubtractPoints(self->mB.x, self->mB.y, v19);
  v28 = TSDMultiplyPointScalar(v26, v27, a3);
  v49 = TSDAddPoints(v19, v18, v28);
  v30 = v29;
  v31 = TSDSubtractPoints(v23, v25, v52);
  v33 = TSDMultiplyPointScalar(v31, v32, a3);
  v34 = TSDAddPoints(v52, v17, v33);
  v36 = v35;
  v37 = TSDSubtractPoints(v49, v30, v23);
  v39 = TSDMultiplyPointScalar(v37, v38, a3);
  v40 = TSDAddPoints(v23, v25, v39);
  v42 = v41;
  v43 = TSDSubtractPoints(v40, v41, v34);
  v45 = TSDMultiplyPointScalar(v43, v44, a3);
  v46 = TSDAddPoints(v34, v36, v45);
  v48 = v47;
  *a4 = +[TSDBezierSegment segmentFromPoint:outPoint:inPoint:toPoint:](TSDBezierSegment, "segmentFromPoint:outPoint:inPoint:toPoint:", v51, v50, v52, v17, v34, v36, v46, v47);
  *a5 = +[TSDBezierSegment segmentFromPoint:outPoint:inPoint:toPoint:](TSDBezierSegment, "segmentFromPoint:outPoint:inPoint:toPoint:", v46, v48, v40, v42, v49, v30, self->mB.x, self->mB.y);
}

- (CGPoint)pointAtParametricValue:(double)a3
{
  CGPoint mOut;
  CGPoint mB;
  double v5;
  double v6;
  float64x2_t v7[4];
  uint64_t v8;
  CGPoint result;

  v8 = *MEMORY[0x24BDAC8D0];
  mOut = self->mOut;
  v7[0] = (float64x2_t)self->mA;
  v7[1] = (float64x2_t)mOut;
  mB = self->mB;
  v7[2] = (float64x2_t)self->mIn;
  v7[3] = (float64x2_t)mB;
  v5 = TSDPointOnCurve(v7, a3);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)closestPointToPoint:(CGPoint)a3
{
  double v4;
  double v5;
  CGPoint result;

  -[TSDBezierSegment parametricValueForPoint:](self, "parametricValueForPoint:", a3.x, a3.y);
  -[TSDBezierSegment pointAtParametricValue:](self, "pointAtParametricValue:");
  result.y = v5;
  result.x = v4;
  return result;
}

@end
