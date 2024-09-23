@implementation MTLFunctionConstantValues(PTPTMTLFunctionConstantValuesAdditions)

- (uint64_t)setConstantFloat:()PTPTMTLFunctionConstantValuesAdditions withName:
{
  float v5;

  v5 = a2;
  return objc_msgSend(a1, "setConstantValue:type:withName:", &v5, 33, a4);
}

- (uint64_t)setConstantFloat2:()PTPTMTLFunctionConstantValuesAdditions withName:
{
  double v5;

  v5 = a2;
  return objc_msgSend(a1, "setConstantValue:type:withName:", &v5, 34, a4);
}

- (uint64_t)setConstantHalf3:()PTPTMTLFunctionConstantValuesAdditions withName:
{
  return objc_msgSend(a1, "setConstantValue:type:withName:", a3, 43, a4);
}

@end
