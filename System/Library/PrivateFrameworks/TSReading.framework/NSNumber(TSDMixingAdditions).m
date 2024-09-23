@implementation NSNumber(TSDMixingAdditions)

- (uint64_t)mixingTypeWithObject:()TSDMixingAdditions
{
  objc_opt_class();
  if (objc_msgSend(a1, "isEqualToNumber:", TSUCheckedDynamicCast()))
    return 5;
  else
    return 3;
}

- (uint64_t)mixedObjectWithFraction:()TSDMixingAdditions ofObject:
{
  void *v2;
  void *v3;

  objc_opt_class();
  v2 = (void *)TSUCheckedDynamicCast();
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "doubleValue");
  objc_msgSend(v2, "doubleValue");
  TSUMixFloats();
  return objc_msgSend(v3, "numberWithDouble:");
}

@end
