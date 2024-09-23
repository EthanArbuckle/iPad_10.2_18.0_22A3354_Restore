@implementation CRLPointSequenceCubicBezierApproximator

- (CRLPointSequenceCubicBezierApproximator)initWithDataPoints:(const void *)a3
{
  CRLPointSequenceCubicBezierApproximator *v4;
  CRLPointSequenceCubicBezierApproximator *v5;
  char *p_dataPoints;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLPointSequenceCubicBezierApproximator;
  v4 = -[CRLPointSequenceCubicBezierApproximator init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    p_dataPoints = (char *)&v4->_dataPoints;
    if (&v5->_dataPoints != a3)
      sub_10001FB60(p_dataPoints, *(char **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
    v5->_n = ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4) - 1;
  }
  return v5;
}

- (void)computeKnots
{
  uint64_t v3;
  double v4;
  unint64_t v5;
  double *v6;
  double v7;
  double v8;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;

  sub_100111254((uint64_t)-[CRLPointSequenceCubicBezierApproximator knots](self, "knots"), -[CRLPointSequenceCubicBezierApproximator n](self, "n") + 1);
  **(_QWORD **)-[CRLPointSequenceCubicBezierApproximator knots](self, "knots") = 0;
  if (-[CRLPointSequenceCubicBezierApproximator n](self, "n"))
  {
    v3 = 0;
    v4 = 0.0;
    v5 = 1;
    do
    {
      v6 = (double *)(*(_QWORD *)-[CRLPointSequenceCubicBezierApproximator dataPoints](self, "dataPoints") + v3);
      v7 = *v6;
      v8 = v6[1];
      v9 = -[CRLPointSequenceCubicBezierApproximator dataPoints](self, "dataPoints");
      v4 = v4 + sqrt(sub_10006108C(v7, v8, *(double *)(*v9 + v3 + 16), *(double *)(*v9 + v3 + 24)));
      *(double *)(*(_QWORD *)-[CRLPointSequenceCubicBezierApproximator knots](self, "knots") + 8 * v5++) = v4;
      v3 += 16;
    }
    while (v5 <= -[CRLPointSequenceCubicBezierApproximator n](self, "n"));
  }
  else
  {
    v4 = 0.0;
  }
  if (-[CRLPointSequenceCubicBezierApproximator n](self, "n"))
  {
    v10 = 1;
    do
    {
      v11 = -[CRLPointSequenceCubicBezierApproximator knots](self, "knots");
      *(double *)(*v11 + 8 * v10) = *(double *)(*v11 + 8 * v10) / v4;
      ++v10;
    }
    while (v10 <= -[CRLPointSequenceCubicBezierApproximator n](self, "n"));
  }
}

- (void)computeErrorDistances
{
  unint64_t v3;
  uint64_t v4;
  float64x2_t *v5;
  double v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  float64x2_t v11;
  float64x2_t v12;

  sub_10001EFCC((uint64_t)-[CRLPointSequenceCubicBezierApproximator errorDistances](self, "errorDistances"), -[CRLPointSequenceCubicBezierApproximator n](self, "n") + 1);
  if ((id)-[CRLPointSequenceCubicBezierApproximator n](self, "n") != (id)1)
  {
    v3 = 1;
    do
    {
      v4 = *(_QWORD *)-[CRLPointSequenceCubicBezierApproximator dataPoints](self, "dataPoints");
      v5 = *(float64x2_t **)-[CRLPointSequenceCubicBezierApproximator dataPoints](self, "dataPoints");
      v6 = 1.0 - *(double *)(*(_QWORD *)-[CRLPointSequenceCubicBezierApproximator knots](self, "knots") + 8 * v3);
      v11 = vmulq_n_f64(*v5, v6 * (v6 * v6));
      v7 = -[CRLPointSequenceCubicBezierApproximator dataPoints](self, "dataPoints");
      v8 = -[CRLPointSequenceCubicBezierApproximator n](self, "n");
      v9 = *v7;
      v10 = -[CRLPointSequenceCubicBezierApproximator knots](self, "knots");
      v12 = vsubq_f64(*(float64x2_t *)(v4 + 16 * v3), vaddq_f64(v11, vmulq_n_f64(*(float64x2_t *)(v9 + 16 * v8), *(double *)(*v10 + 8 * v3) * (*(double *)(*v10 + 8 * v3) * *(double *)(*v10 + 8 * v3)))));
      *(float64x2_t *)(*(_QWORD *)-[CRLPointSequenceCubicBezierApproximator errorDistances](self, "errorDistances")
                     + 16 * v3++) = v12;
    }
    while ((char *)v3 <= (char *)-[CRLPointSequenceCubicBezierApproximator n](self, "n") - 1);
  }
}

- (void)computeConstantVector
{
  uint64_t i;
  double y;
  double x;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  double *v10;

  for (i = 1; i != 3; ++i)
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
    if ((id)-[CRLPointSequenceCubicBezierApproximator n](self, "n") != (id)1)
    {
      v6 = 0;
      v7 = 1;
      do
      {
        v8 = *(_QWORD *)-[CRLPointSequenceCubicBezierApproximator errorDistances](self, "errorDistances") + v6;
        v9 = sub_1001113B0(i, *(double *)(*(_QWORD *)-[CRLPointSequenceCubicBezierApproximator knots](self, "knots") + 8 * v7));
        x = x + v9 * *(double *)(v8 + 16);
        y = y + v9 * *(double *)(v8 + 24);
        ++v7;
        v6 += 16;
      }
      while ((char *)v7 <= (char *)-[CRLPointSequenceCubicBezierApproximator n](self, "n") - 1);
    }
    v10 = (double *)((char *)-[CRLPointSequenceCubicBezierApproximator rhs](self, "rhs") + 16 * i);
    *(v10 - 2) = x;
    *(v10 - 1) = y;
  }
}

- (void)computeCoefficientMatrix
{
  uint64_t i;
  uint64_t j;
  unint64_t v5;
  double v6;
  double v7;

  for (i = 1; i != 3; ++i)
  {
    for (j = 1; j != 3; ++j)
    {
      -[CRLPointSequenceCubicBezierApproximator n](self, "n");
      v5 = 0;
      v6 = 0.0;
      do
      {
        v7 = sub_1001113B0(i, *(double *)(*(_QWORD *)-[CRLPointSequenceCubicBezierApproximator knots](self, "knots") + 8 * v5));
        v6 = v6
           + v7
           * sub_1001113B0(j, *(double *)(*(_QWORD *)-[CRLPointSequenceCubicBezierApproximator knots](self, "knots") + 8 * v5++));
      }
      while (v5 <= -[CRLPointSequenceCubicBezierApproximator n](self, "n"));
      *((double *)-[CRLPointSequenceCubicBezierApproximator lhs](self, "lhs") + 2 * i + j - 3) = v6;
    }
  }
}

- (void)computeControlPoints
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
  CRLPointVector2 *v13;
  double v14;
  double v15;
  CRLPointVector2 *v16;
  CRLPointVector2 *v17;
  double v18;
  double v19;
  CRLPointVector2 *v20;

  v3 = *(double *)-[CRLPointSequenceCubicBezierApproximator lhs](self, "lhs");
  v4 = *((double *)-[CRLPointSequenceCubicBezierApproximator lhs](self, "lhs") + 1);
  v5 = *((double *)-[CRLPointSequenceCubicBezierApproximator lhs](self, "lhs") + 2);
  v6 = *((double *)-[CRLPointSequenceCubicBezierApproximator lhs](self, "lhs") + 3);
  v7 = v3 * v6 - v4 * v5;
  if (v7 >= 0.000001)
  {
    v8 = -v4;
    v9 = v6 / v7;
    v10 = v8 / v7;
    v11 = -v5 / v7;
    v12 = v3 / v7;
    v13 = -[CRLPointSequenceCubicBezierApproximator rhs](self, "rhs");
    v14 = v9 * v13->v[0].x;
    v15 = v9 * v13->v[0].y;
    v16 = -[CRLPointSequenceCubicBezierApproximator rhs](self, "rhs");
    -[CRLPointSequenceCubicBezierApproximator setControlPoint1:](self, "setControlPoint1:", v14 + v10 * v16->v[1].x, v15 + v10 * v16->v[1].y);
    v17 = -[CRLPointSequenceCubicBezierApproximator rhs](self, "rhs");
    v18 = v11 * v17->v[0].x;
    v19 = v11 * v17->v[0].y;
    v20 = -[CRLPointSequenceCubicBezierApproximator rhs](self, "rhs");
    -[CRLPointSequenceCubicBezierApproximator setControlPoint2:](self, "setControlPoint2:", v18 + v12 * v20->v[1].x, v19 + v12 * v20->v[1].y);
  }
  else
  {
    -[CRLPointSequenceCubicBezierApproximator setApproximationError:](self, "setApproximationError:", INFINITY);
  }
}

- (void)computeApproximationError
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  double *v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  CGPoint v16;
  float64x2_t v17;
  unint64_t v18;
  float64x2_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;

  v20 = *(_OWORD *)*(_QWORD *)-[CRLPointSequenceCubicBezierApproximator dataPoints](self, "dataPoints");
  -[CRLPointSequenceCubicBezierApproximator controlPoint1](self, "controlPoint1");
  v21 = v3;
  v22 = v4;
  -[CRLPointSequenceCubicBezierApproximator controlPoint2](self, "controlPoint2");
  v23 = v5;
  v24 = v6;
  v7 = -[CRLPointSequenceCubicBezierApproximator dataPoints](self, "dataPoints");
  v25 = *(_OWORD *)(*v7 + 16 * -[CRLPointSequenceCubicBezierApproximator n](self, "n"));
  -[CRLPointSequenceCubicBezierApproximator approximationError](self, "approximationError");
  if ((v8 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
  {
    -[CRLPointSequenceCubicBezierApproximator n](self, "n");
    v9 = 0;
    v10 = 0.0;
    do
    {
      v11 = (double *)(*(_QWORD *)-[CRLPointSequenceCubicBezierApproximator dataPoints](self, "dataPoints") + 16 * v9);
      v12 = *v11;
      v13 = v11[1];
      v14 = 0;
      v15 = *(double *)(*(_QWORD *)-[CRLPointSequenceCubicBezierApproximator knots](self, "knots") + 8 * v9);
      v16 = CGPointZero;
      do
      {
        v17 = vaddq_f64((float64x2_t)v16, vmulq_n_f64(*((float64x2_t *)&v20 + v14), sub_1001113B0(v14, v15)));
        v19 = v17;
        v16 = (CGPoint)v17;
        ++v14;
      }
      while (v14 != 4);
      v10 = v10 + sub_10006010C(v17.f64[0], v17.f64[1], v12, v13);
      ++v9;
    }
    while (v9 <= -[CRLPointSequenceCubicBezierApproximator n](self, "n", *(_OWORD *)&v19));
    -[CRLPointSequenceCubicBezierApproximator setApproximationError:](self, "setApproximationError:", sqrt(v10));
  }
  v18 = -1;
  do
    ++v18;
  while (v18 <= -[CRLPointSequenceCubicBezierApproximator n](self, "n"));
}

- (void)run
{
  float64x2_t **v3;
  float64x2_t v4;
  float64x2_t **v10;
  float64x2_t v11;

  if (-[CRLPointSequenceCubicBezierApproximator n](self, "n") < 3)
  {
    if ((id)-[CRLPointSequenceCubicBezierApproximator n](self, "n") == (id)2)
    {
      v3 = -[CRLPointSequenceCubicBezierApproximator dataPoints](self, "dataPoints");
      v4 = vaddq_f64(vaddq_f64(**v3, **v3), *(float64x2_t *)(*(_QWORD *)-[CRLPointSequenceCubicBezierApproximator dataPoints](self, "dataPoints") + 16));
      __asm { FMOV            V1.2D, #3.0 }
      v11 = _Q1;
      -[CRLPointSequenceCubicBezierApproximator setControlPoint1:](self, "setControlPoint1:", vdivq_f64(v4, _Q1));
      v10 = -[CRLPointSequenceCubicBezierApproximator dataPoints](self, "dataPoints");
      -[CRLPointSequenceCubicBezierApproximator setControlPoint2:](self, "setControlPoint2:", vdivq_f64(vaddq_f64(vaddq_f64((*v10)[2], (*v10)[2]), *(float64x2_t *)(*(_QWORD *)-[CRLPointSequenceCubicBezierApproximator dataPoints](self, "dataPoints") + 16)), v11));
      -[CRLPointSequenceCubicBezierApproximator setApproximationError:](self, "setApproximationError:", 0.0);
    }
  }
  else
  {
    -[CRLPointSequenceCubicBezierApproximator computeKnots](self, "computeKnots");
    -[CRLPointSequenceCubicBezierApproximator computeErrorDistances](self, "computeErrorDistances");
    -[CRLPointSequenceCubicBezierApproximator computeConstantVector](self, "computeConstantVector");
    -[CRLPointSequenceCubicBezierApproximator computeCoefficientMatrix](self, "computeCoefficientMatrix");
    -[CRLPointSequenceCubicBezierApproximator computeControlPoints](self, "computeControlPoints");
    -[CRLPointSequenceCubicBezierApproximator computeApproximationError](self, "computeApproximationError");
  }
}

- (CGPoint)controlPoint1
{
  double x;
  double y;
  CGPoint result;

  x = self->_controlPoint1.x;
  y = self->_controlPoint1.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setControlPoint1:(CGPoint)a3
{
  self->_controlPoint1 = a3;
}

- (CGPoint)controlPoint2
{
  double x;
  double y;
  CGPoint result;

  x = self->_controlPoint2.x;
  y = self->_controlPoint2.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setControlPoint2:(CGPoint)a3
{
  self->_controlPoint2 = a3;
}

- (double)approximationError
{
  return self->_approximationError;
}

- (void)setApproximationError:(double)a3
{
  self->_approximationError = a3;
}

- (void)dataPoints
{
  return &self->_dataPoints;
}

- (unint64_t)n
{
  return self->_n;
}

- (void)setN:(unint64_t)a3
{
  self->_n = a3;
}

- (void)knots
{
  return &self->_knots;
}

- (void)errorDistances
{
  return &self->_errorDistances;
}

- (CRLMatrix2x2)lhs
{
  return &self->_lhs;
}

- (CRLPointVector2)rhs
{
  return &self->_rhs;
}

- (void).cxx_destruct
{
  CGPoint *begin;
  double *v4;
  CGPoint *v5;

  begin = self->_errorDistances.__begin_;
  if (begin)
  {
    self->_errorDistances.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_knots.__begin_;
  if (v4)
  {
    self->_knots.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_dataPoints.__begin_;
  if (v5)
  {
    self->_dataPoints.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  CGPoint v2;

  *((_QWORD *)self + 19) = 0;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  v2 = CGPointZero;
  *((CGPoint *)self + 10) = CGPointZero;
  *((CGPoint *)self + 11) = v2;
  return self;
}

@end
