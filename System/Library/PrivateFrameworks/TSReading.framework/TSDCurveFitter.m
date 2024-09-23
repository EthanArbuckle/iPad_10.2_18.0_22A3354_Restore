@implementation TSDCurveFitter

+ (id)curveFitter
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (TSDCurveFitter)init
{
  TSDCurveFitter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDCurveFitter;
  result = -[TSDCurveFitter init](&v3, sel_init);
  if (result)
  {
    result->mErrorDistance = 4.0;
    result->mErrorIterations = 1;
  }
  return result;
}

- (id)bezierPathFittingPoints:(id)a3
{
  id v5;

  v5 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  -[TSDCurveFitter fitCurveToPoints:bezierCallback:context:](self, "fitCurveToPoints:bezierCallback:context:", a3, p_bezierPathFittingPointsCallback, v5);
  return v5;
}

- (id)bezierPathFittingPointArray:(id *)a3 count:(int64_t)a4
{
  id v7;

  v7 = +[TSDBezierPath bezierPath](TSDBezierPath, "bezierPath");
  -[TSDCurveFitter fitCurveToPointArray:count:bezierCallback:context:](self, "fitCurveToPointArray:count:bezierCallback:context:", a3, a4, p_bezierPathFittingPointsCallback, v7);
  return v7;
}

- (void)fitCurveToPoints:(id)a3 bezierCallback:(void *)a4 context:(void *)a5
{
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v9 = objc_msgSend(a3, "count");
  if (v9)
  {
    v10 = v9;
    v11 = malloc_type_malloc(16 * v9, 0x1000040451B5BE8uLL);
    v12 = v11;
    if (v10 >= 1)
    {
      v13 = 0;
      v14 = v11 + 1;
      do
      {
        objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v13), "CGPointValue");
        *(v14 - 1) = v15;
        *v14 = v16;
        ++v13;
        v14 += 2;
      }
      while (v10 != v13);
    }
    -[TSDCurveFitter fitCurveToPointArray:count:bezierCallback:context:](self, "fitCurveToPointArray:count:bezierCallback:context:", v12, v10, a4, a5);
    free(v12);
  }
}

- (void)fitCurveToPointArray:(id *)a3 count:(int64_t)a4 bezierCallback:(void *)a5 context:(void *)a6
{
  double **v9;
  uint64_t v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  double v15;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v16;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v17;
  double v18;
  unint64_t v19;
  double **v20;
  unint64_t v21;
  double mErrorIterations;
  void *v23;
  void *v24;

  mErrorIterations = (double)self->mErrorIterations;
  v23 = a5;
  v24 = a6;
  v21 = a4;
  v9 = (double **)malloc_type_malloc(8 * a4, 0x2004093837F09uLL);
  v20 = v9;
  if (a4)
  {
    v10 = 0;
    do
      v9[v10++] = (double *)malloc_type_malloc(0x20uLL, 0x1000040451B5BE8uLL);
    while (a4 != v10);
    if (a4 < 2)
      goto LABEL_10;
    v11.n128_f64[0] = a3[1].var0 - a3->var0;
    v12.n128_f64[0] = a3[1].var1 - a3->var1;
    v15 = sqrt(v12.n128_f64[0] * v12.n128_f64[0] + v11.n128_f64[0] * v11.n128_f64[0]);
    if (v15 != 0.0)
    {
      v11.n128_f64[0] = v11.n128_f64[0] / v15;
      v12.n128_f64[0] = v12.n128_f64[0] / v15;
    }
    v16 = &a3[a4];
    v17 = &a3[a4 - 1];
    v13.n128_f64[0] = v16[-2].var0 - v17->var0;
    v14.n128_f64[0] = v16[-2].var1 - v17->var1;
    v18 = sqrt(v14.n128_f64[0] * v14.n128_f64[0] + v13.n128_f64[0] * v13.n128_f64[0]);
    if (v18 != 0.0)
    {
      v13.n128_f64[0] = v13.n128_f64[0] / v18;
      v14.n128_f64[0] = v14.n128_f64[0] / v18;
    }
    FitCubic((uint64_t)a3, 0, a4 - 1, &v20, v11, v12, v13, v14, self->mErrorDistance);
    if (v21)
    {
LABEL_10:
      v19 = 0;
      do
        free(v20[v19++]);
      while (v19 < v21);
      v21 = 0;
    }
    v9 = v20;
  }
  if (v9)
    free(v9);
}

- (double)errorDistance
{
  return self->mErrorDistance;
}

- (void)setErrorDistance:(double)a3
{
  self->mErrorDistance = a3;
}

- (int64_t)errorIterations
{
  return self->mErrorIterations;
}

- (void)setErrorIterations:(int64_t)a3
{
  self->mErrorIterations = a3;
}

@end
