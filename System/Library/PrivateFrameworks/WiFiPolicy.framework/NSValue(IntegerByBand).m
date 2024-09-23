@implementation NSValue(IntegerByBand)

+ (uint64_t)valuewithIntegerByBand:()IntegerByBand
{
  return objc_msgSend(a1, "valueWithBytes:objCType:", a3, "{?=[3q][3B]}");
}

- (uint64_t)integerByBandValue
{
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return objc_msgSend(a1, "getValue:", x8_0);
}

@end
