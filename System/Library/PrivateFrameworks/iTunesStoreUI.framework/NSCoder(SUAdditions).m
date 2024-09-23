@implementation NSCoder(SUAdditions)

- (CGPatternRef)safeEncodeUIColor:()SUAdditions forKey:
{
  CGColor *v7;
  CGPatternRef result;

  v7 = (CGColor *)objc_msgSend(a3, "CGColor");
  if (!v7)
    return (CGPatternRef)objc_msgSend(a1, "encodeObject:forKey:", a3, a4);
  result = CGColorGetPattern(v7);
  if (!result)
    return (CGPatternRef)objc_msgSend(a1, "encodeObject:forKey:", a3, a4);
  return result;
}

@end
