@implementation UIColorEffect(Private)

+ (id)sessionColorEffectDark
{
  _OWORD v2[5];

  v2[0] = xmmword_22BA8CDE0;
  v2[1] = xmmword_22BA8CDF0;
  v2[2] = xmmword_22BA8CE00;
  v2[3] = xmmword_22BA8CE10;
  v2[4] = xmmword_22BA8CE20;
  objc_msgSend(a1, "_colorEffectCAMatrix:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sessionColorEffectLight
{
  _OWORD v2[3];
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v2[0] = xmmword_22BA8CE30;
  v2[1] = xmmword_22BA8CE40;
  v2[2] = xmmword_22BA8CE50;
  v3 = 1060864002;
  v5 = 0;
  v4 = 0;
  v6 = 0;
  v7 = 1065353216;
  objc_msgSend(a1, "_colorEffectCAMatrix:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
