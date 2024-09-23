@implementation NSNumber(TransparencyDate)

- (unint64_t)kt_enumValueWithMax:()TransparencyDate defaultValue:
{
  unint64_t result;

  result = objc_msgSend(a1, "unsignedIntegerValue");
  if (result > a3)
    return a4;
  return result;
}

@end
