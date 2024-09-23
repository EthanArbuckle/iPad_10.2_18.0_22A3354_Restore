@implementation PIAutoCalculatorUtils

+ (CGPoint)convertFacePoint:(CGPoint)a3 toImagePointWithFaceRect:(CGRect)a4 orientation:(int64_t)a5
{
  double v5;
  double v6;
  CGPoint result;

  NUOrientationTransformPoint();
  result.y = v6;
  result.x = v5;
  return result;
}

+ (CGPoint)averagePoints:(const CGPoint *)a3 pointCount:(unint64_t)a4
{
  float64x2_t v4;
  unint64_t v5;
  float64x2_t v6;
  float64x2_t v7;
  double v8;
  CGPoint result;

  v4 = 0uLL;
  if (a4)
  {
    v5 = a4;
    do
    {
      v6 = *(float64x2_t *)a3++;
      v4 = vaddq_f64(v4, v6);
      --v5;
    }
    while (v5);
  }
  v7 = vdivq_f64(v4, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)a4), 0));
  v8 = v7.f64[1];
  result.x = v7.f64[0];
  result.y = v8;
  return result;
}

+ (CGPoint)averageCGPoints:(const CGPoint *)a3 pointCount:(unint64_t)a4
{
  float64x2_t v4;
  unint64_t v5;
  float64x2_t v6;
  float64x2_t v7;
  double v8;
  CGPoint result;

  v4 = 0uLL;
  if (a4)
  {
    v5 = a4;
    do
    {
      v6 = *(float64x2_t *)a3++;
      v4 = vaddq_f64(v4, v6);
      --v5;
    }
    while (v5);
  }
  v7 = vdivq_f64(v4, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)a4), 0));
  v8 = v7.f64[1];
  result.x = v7.f64[0];
  result.y = v8;
  return result;
}

@end
