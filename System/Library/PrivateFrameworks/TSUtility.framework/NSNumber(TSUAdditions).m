@implementation NSNumber(TSUAdditions)

+ (uint64_t)tsu_numberWithCGFloat:()TSUAdditions
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
}

- (BOOL)tsu_isFloatingPointType
{
  return (*(_BYTE *)objc_msgSend(a1, "objCType") & 0xFD) == 100;
}

@end
