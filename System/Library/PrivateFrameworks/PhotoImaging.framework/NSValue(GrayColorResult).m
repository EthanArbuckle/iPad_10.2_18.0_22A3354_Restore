@implementation NSValue(GrayColorResult)

- (uint64_t)pi_grayColorResultValue
{
  *(_QWORD *)(x8_0 + 64) = 0;
  *(_OWORD *)(x8_0 + 32) = 0u;
  *(_OWORD *)(x8_0 + 48) = 0u;
  *(_OWORD *)x8_0 = 0u;
  *(_OWORD *)(x8_0 + 16) = 0u;
  return objc_msgSend(a1, "getValue:", x8_0);
}

+ (uint64_t)pi_valueWithGrayColorResult:()GrayColorResult
{
  return objc_msgSend(a1, "valueWithBytes:objCType:", a3, "{?={?=[4d]}{?=[4d]}d}");
}

@end
