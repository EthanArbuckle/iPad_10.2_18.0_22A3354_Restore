@implementation NSNumber(WFApproximation)

- (BOOL)WF_isEqualToNumber:()WFApproximation withPrecision:
{
  float v6;
  float v7;
  float v8;

  objc_msgSend(a1, "floatValue");
  v7 = v6;
  objc_msgSend(a4, "floatValue");
  return vabds_f32(v7, v8) < a2;
}

@end
