@implementation SHMaths

+ (double)interpolateValue:(double)a3 leftMin:(double)a4 leftMax:(double)a5 rightMin:(double)a6 rightMax:(double)a7
{
  double v7;
  double v8;

  if (a3 <= a5)
    v7 = a3;
  else
    v7 = a5;
  if (a3 >= a4)
    v8 = v7;
  else
    v8 = a4;
  return a6 + (v8 - a4) / (a5 - a4) * (a7 - a6);
}

@end
