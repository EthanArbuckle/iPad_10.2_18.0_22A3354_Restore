@implementation NSNumber(Binary)

- (unint64_t)isBitSet:()Binary
{
  return ((unint64_t)objc_msgSend(a1, "unsignedLongValue") >> a3) & 1;
}

@end
