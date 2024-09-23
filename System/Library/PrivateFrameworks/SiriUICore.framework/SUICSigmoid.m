@implementation SUICSigmoid

+ (float)sigmoid:(float)a3
{
  float result;

  result = 0.0;
  if (a3 > -10.0)
  {
    result = 1.0;
    if (a3 < 10.0)
      return sigmoid_vals[(int)((a3 + 10.0) * 10.0)];
  }
  return result;
}

+ (float)sigmoid_norm:(float)a3
{
  double v3;
  float result;

  *(float *)&v3 = a3 * 12.0;
  objc_msgSend(a1, "sigmoid:", v3);
  return result;
}

@end
