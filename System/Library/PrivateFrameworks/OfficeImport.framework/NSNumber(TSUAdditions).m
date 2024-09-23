@implementation NSNumber(TSUAdditions)

+ (uint64_t)numberWithCGFloat:()TSUAdditions
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
}

- (BOOL)isFloatingPointType
{
  return (*(_BYTE *)objc_msgSend(a1, "objCType") & 0xFD) == 100;
}

- (BOOL)tsu_isAlmostEqual:()TSUAdditions
{
  double v4;
  double v5;
  double v6;

  objc_msgSend(a1, "doubleValue");
  v5 = v4;
  objc_msgSend(a3, "doubleValue");
  return vabdd_f64(v5, v6) < 0.01;
}

@end
