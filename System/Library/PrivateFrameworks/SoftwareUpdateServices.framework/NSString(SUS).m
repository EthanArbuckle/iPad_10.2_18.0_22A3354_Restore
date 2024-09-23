@implementation NSString(SUS)

- (uint64_t)compareNumerically:()SUS
{
  return objc_msgSend(a1, "compare:options:", a3, 64);
}

@end
