@implementation NSValue(PXSimpleIndexPath)

- (uint64_t)px_simpleIndexPathValue
{
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return objc_msgSend(a1, "getValue:", x8_0);
}

+ (uint64_t)px_valueWithSimpleIndexPath:()PXSimpleIndexPath
{
  return objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", a3, "{PXSimpleIndexPath=qqqq}");
}

@end
