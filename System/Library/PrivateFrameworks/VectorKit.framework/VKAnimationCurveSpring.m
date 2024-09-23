@implementation VKAnimationCurveSpring

float __VKAnimationCurveSpring_block_invoke_2(float *a1, float a2)
{
  float v2;

  v2 = a1[8] + (float)(a1[9] * a2);
  return -(float)((float)(expf(-(float)(a2 * a1[10])) * v2) + -1.0);
}

float __VKAnimationCurveSpring_block_invoke(float *a1, float a2)
{
  float v3;
  float v4;
  float v5;
  __float2 v6;

  v3 = a1[8] * a2;
  v4 = expf((float)-(float)(a2 * a1[9]) * a1[10]);
  v5 = a1[11];
  v6 = __sincosf_stret(v3);
  return -(float)((float)((float)((float)(v5 * v6.__cosval) + (float)(a1[12] * v6.__sinval)) * v4) + -1.0);
}

@end
